import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yana_gaman/ui/widgets/progressView.dart';

enum ProgressDialogType { Normal, Download }

String _dialogMessage = "Loading...";
double _progress = 0.0, _maxProgress = 100.0;

bool _isShowing = false;
BuildContext _context, _dismissingContext;
ProgressDialogType _progressDialogType;
bool _barrierDismissible = true, _showLogs = false;

TextStyle _progressTextStyle = TextStyle(
        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    _messageStyle = TextStyle(
        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600);

double _dialogElevation = 8.0, _borderRadius = 8.0;
Color _backgroundColor = Colors.white;
Curve _insetAnimCurve = Curves.easeInOut;

class ProgressDlg {
  ProgressView _dialog;

  ProgressDlg(BuildContext context,
      {ProgressDialogType type, bool isDismissible, bool showLogs}) {
    _context = context;
    _progressDialogType = type ?? ProgressDialogType.Normal;
    _barrierDismissible = isDismissible ?? true;
    _showLogs = showLogs ?? false;
  }

  void style(
      {double progress,
      double maxProgress,
      String message,
      Widget progressWidget,
      Color backgroundColor,
      TextStyle progressTextStyle,
      TextStyle messageTextStyle,
      double elevation,
      double borderRadius,
      Curve insetAnimCurve}) {
    if (_isShowing) return;
    if (_progressDialogType == ProgressDialogType.Download) {
      _progress = progress ?? _progress;
    }

    _dialogMessage = message ?? _dialogMessage;
    _maxProgress = maxProgress ?? _maxProgress;
    _backgroundColor = backgroundColor ?? _backgroundColor;
    _messageStyle = messageTextStyle ?? _messageStyle;
    _progressTextStyle = progressTextStyle ?? _progressTextStyle;
    _dialogElevation = elevation ?? _dialogElevation;
    _borderRadius = borderRadius ?? _borderRadius;
    _insetAnimCurve = insetAnimCurve ?? _insetAnimCurve;
  }

  void update(
      {double progress,
      double maxProgress,
      String message,
      Widget progressWidget,
      TextStyle progressTextStyle,
      TextStyle messageTextStyle}) {
    if (_progressDialogType == ProgressDialogType.Download) {
      _progress = progress ?? _progress;
    }

    _dialogMessage = message ?? _dialogMessage;
    _maxProgress = maxProgress ?? _maxProgress;
    _messageStyle = messageTextStyle ?? _messageStyle;
    _progressTextStyle = progressTextStyle ?? _progressTextStyle;

//    if (_isShowing) _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void dismiss() {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(_dismissingContext).canPop()) {
          Navigator.of(_dismissingContext).pop();
          if (_showLogs) debugPrint('ProgressDialog dismissed');
        } else {
          if (_showLogs) debugPrint('Cant pop ProgressDialog');
        }
      } catch (_) {}
    } else {
      if (_showLogs) debugPrint('ProgressDialog already dismissed');
    }
  }

  Future<bool> hide() {
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.of(_dismissingContext).pop(true);
        if (_showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } catch (_) {
        return Future.value(false);
      }
    } else {
      if (_showLogs) debugPrint('ProgressDialog already dismissed');
      return Future.value(false);
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = new ProgressView();
      _isShowing = true;

      if (_showLogs) debugPrint('ProgressDialog shown');

      showDialog<dynamic>(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _dismissingContext = context;
          return WillPopScope(
            onWillPop: () {
              return Future.value(_barrierDismissible);
            },
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetAnimationCurve: _insetAnimCurve,
              insetAnimationDuration: Duration(milliseconds: 100),
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_dialog],
              ),
            ),
          );
        },
      );
    } else {
      if (_showLogs) debugPrint("ProgressDialog already shown/showing");
    }
  }
}
