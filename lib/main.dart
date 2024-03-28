import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pr8/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:pr8/features/admin/presentation/pages/admin_page.dart';
import 'package:pr8/features/cart/presentation/pages/cart_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pr8/features/product/data/models/product_adapter.dart';
import 'package:pr8/features/product/data/models/product_model.dart';
import 'package:pr8/features/product/presentation/cubit/product_cubit.dart';
import 'features/product/presentation/pages/product_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<ProductModel>('productBox');
  await di.init();
  runApp(const Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ProductCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<AdminCubit>(),
        ),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AdminPage());
  }
}
