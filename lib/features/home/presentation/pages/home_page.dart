import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:the_movie/features/home/presentation/bloc/home_bloc.dart";
import "package:the_movie/features/home/presentation/bloc/home_event.dart";
import "package:the_movie/features/home/presentation/bloc/home_state.dart";

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = HomeBloc();

    useEffect(() {
      bloc.add(const HomeEvent.getData());

      return bloc.close;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "home",
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          return state.map(
            initial: (_) {
              return const SizedBox.shrink();
            },
            loading: (_) {
              return const SizedBox.shrink();
            },
            success: (value) {
              return Text("data $value");
            },
            error: (_) {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
