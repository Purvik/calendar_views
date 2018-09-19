import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'custom_page_view.dart';
import 'custom_page_view_communicator.dart';

/// Controller for a [CustomPageView].
abstract class CustomPageViewController {
  const CustomPageViewController();

  @protected
  CustomPageViewCommunicator get attachedItem;

  /// Returns true if [CustomPageView] is attached to this controller.
  @protected
  bool get isItemAttached => attachedItem != null;

  /// Returns the current page in the attached [CustomPageView].
  ///
  /// If nothing is attached to this controller it throws an exception.
  int get currentPage {
    throwExceptionIfNoItemAttached();

    return attachedItem.currentPage();
  }

  /// Tels the controlled [CustomPageView] to jump to a [page].
  ///
  /// If nothing is attached to this controller it throws an exception.
  void jumpToPage(int page) {
    throwExceptionIfNoItemAttached();

    attachedItem.jumpToPage(page);
  }

  /// Tels the controlled [CustomPageView] to animate to a [page].
  ///
  /// If nothing is attached to this controller it throws an exception.
  Future<Null> animateToPage(
    int page, {
    @required Duration duration,
    @required Curve curve,
  }) {
    throwExceptionIfNoItemAttached();

    return attachedItem.animateToPage(
      page,
      duration: duration,
      curve: curve,
    );
  }

  /// Throws an exception in no [CustomPageView] is attached to this controller.
  @protected
  void throwExceptionIfNoItemAttached() {
    if (!isItemAttached) {
      throw new Exception(
        "Could not perform operation, no item is attached to this controller",
      );
    }
  }
}
