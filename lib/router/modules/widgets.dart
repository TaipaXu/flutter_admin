import 'package:flutter/material.dart';
import '/models/baseView.dart' as model;
import '/models/groupView.dart' as model;
import '/models/innerView.dart' as model;
import '/pages/icons.dart' as page;
import '/pages/contextMenu.dart' as page;
import '/pages/richText.dart' as page;
import '/pages/markdown.dart' as page;
import '/pages/calendar.dart' as page;
import '/pages/dialog.dart' as page;
import '/pages/drawer.dart' as page;
import '/pages/loading.dart' as page;
import '/pages/messages.dart' as page;
import '/pages/clipboard.dart' as page;

final List<model.BaseView> routes = [
  model.GroupView(
    name: 'widgets',
    title: 'Widgets',
    icon: const Icon(
      Icons.widgets,
    ),
    children: [
      model.InnerView(
        name: 'icons',
        title: 'Icons',
        page: const page.MaterialIcons(),
        permission: 'icons',
      ),
      model.InnerView(
        name: 'contextMenu',
        title: 'Context menu',
        page: const page.ContextMenu(),
      ),
      model.InnerView(
        name: 'richText',
        title: 'Rich Text',
        page: const page.RichText(),
      ),
      model.InnerView(
        name: 'markdown',
        title: 'Markdown',
        page: const page.Markdown(),
      ),
      model.InnerView(
        name: 'calendar',
        title: 'Calendar',
        page: const page.Calendar(),
      ),
      model.InnerView(
        name: 'dialog',
        title: 'Dialog',
        page: const page.Dialog(),
      ),
      model.InnerView(
        name: 'drawer',
        title: 'Drawer',
        page: const page.Drawer(),
      ),
      model.InnerView(
        name: 'loading',
        title: 'Loading',
        page: const page.Loading(),
      ),
      model.InnerView(
        name: 'messages',
        title: 'Messages',
        page: const page.Message(),
      ),
      model.InnerView(
        name: 'clipboard',
        title: 'Clipboard',
        page: const page.Clipboard(),
      ),
    ],
  ),
];
