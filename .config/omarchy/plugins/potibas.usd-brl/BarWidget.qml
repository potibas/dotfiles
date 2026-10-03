import QtQuick
import Quickshell.Io
import qs.Commons
import qs.Ui as Ui

Ui.BarWidget {
  id: root
  moduleName: "potibas.usd-brl"

  property string quote: ""
  property string quoteTime: ""
  property string checkedTime: ""
  property bool failed: false
  property bool received: false
  readonly property string tooltip: "USD/BRL · AwesomeAPI (bid)"
    + (quoteTime ? "\nQuote: " + quoteTime : "")
    + (checkedTime ? "\nChecked: " + checkedTime : "")
    + (request.running ? "\nRefreshing…" : failed ? "\nRefresh failed; showing last available quote" : "")
    + "\nClick to refresh · Auto-refresh every 10 minutes"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  function refresh() {
    if (request.running) return
    received = false
    request.running = true
    poll.restart()
  }

  Component.onCompleted: refresh()

  Timer {
    id: poll
    interval: 600000
    repeat: true
    running: true
    onTriggered: root.refresh()
  }

  Process {
    id: request
    command: ["curl", "--fail", "--silent", "--show-error",
      "--connect-timeout", "10", "--max-time", "20",
      "https://economia.awesomeapi.com.br/json/last/USD-BRL"]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: {
        try {
          var data = JSON.parse(text).USDBRL
          var bid = Number(data.bid)
          if (!isFinite(bid) || bid <= 0) return
          root.quote = bid.toFixed(2)
          root.quoteTime = data.timestamp
            ? Qt.formatDateTime(new Date(Number(data.timestamp) * 1000), "yyyy-MM-dd HH:mm:ss")
            : String(data.create_date || "")
          root.checkedTime = Qt.formatDateTime(new Date(), "HH:mm:ss")
          root.received = true
          root.failed = false
          console.debug("USD/BRL refreshed: " + root.quote + " (quote: " + root.quoteTime + ")")
        } catch (e) {
          root.failed = true
        }
      }
    }
    stderr: StdioCollector { }
    onExited: function(exitCode, exitStatus) {
      if (exitCode !== 0 || !root.received) {
        root.failed = true
        console.debug("USD/BRL refresh failed; keeping last quote")
      }
    }
  }

  Ui.WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "USD/BRL " + (root.quote || "—")
    fontSize: Style.font.caption
    horizontalMargin: 4
    tooltipText: root.tooltip
    onPressed: function(b) {
      if (b === Qt.LeftButton) root.broadcast("refresh")
    }
  }
}
