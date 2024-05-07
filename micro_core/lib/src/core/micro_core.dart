import 'package:flutter/widgets.dart';
// utilizar nas rotas
typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? args);
// chamar a nagecacao
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
