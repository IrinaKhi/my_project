import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'package:project_du/screens/account_screen.dart';

import 'package:project_du/tabFirst/gameplay.dart';

import 'package:project_du/tabThird/notifications.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// DATA

const List<Map<String, String>> seconds = [
  {
    'id': '1',
    'title': 'Explaining Flutter Nav 2.0 and Beamer',
    'author': 'Toby Lewis',
  },
  {
    'id': '2',
    'title': 'Flutter Navigator 2.0 for mobile dev: 101',
    'author': 'Lulupointu',
  },
  {
    'id': '3',
    'title': 'Flutter: An Easy and Pragmatic Approach to Navigator 2.0',
    'author': 'Marco Muccinelli',
  },
];

// SCREENS

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyGameplayPage();
  }
}

class SecondTabScreen extends StatelessWidget {
  const SecondTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Tab')),
      body: ListView(
        children: seconds
            .map(
              (second) => ListTile(
                title: Text(second['title']!),
                subtitle: Text(second['author']!),
                onTap: () => context.beamToNamed('/seconds/${second['id']}'),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SecondTabDetailsScreen extends StatelessWidget {
  const SecondTabDetailsScreen({super.key, required this.second});
  final Map<String, String> second;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(second['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Author: ${second['author']}'),
      ),
    );
  }
}

class ThirdTabScreen extends StatelessWidget {
  const ThirdTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyNotificationsPage();
  }
}

class FourthTabScreen extends StatelessWidget {
  const FourthTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountScreen();
  }
}

// LOCATIONS
class FirstTabLocation extends BeamLocation<BeamState> {
  FirstTabLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('first'),
          title: 'First',
          type: BeamPageType.noTransition,
          child: FirstTabScreen(),
        ),
      ];
}

class SecondTabLocation extends BeamLocation<BeamState> {
  SecondTabLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/seconds/:secondId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('seconds'),
          title: 'Seconds',
          type: BeamPageType.noTransition,
          child: SecondTabScreen(),
        ),
        if (state.pathParameters.containsKey('secondId'))
          BeamPage(
            key: ValueKey('seconds-${state.pathParameters['secondId']}'),
            title: seconds.firstWhere((second) =>
                second['id'] == state.pathParameters['secondId'])['title'],
            child: SecondTabDetailsScreen(
              second: seconds.firstWhere(
                  (second) => second['id'] == state.pathParameters['secondId']),
            ),
          ),
      ];
}

class ThirdTabLocation extends BeamLocation<BeamState> {
  ThirdTabLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('third'),
          title: 'Third',
          type: BeamPageType.noTransition,
          child: ThirdTabScreen(),
        ),
      ];
}

class FourthTabLocation extends BeamLocation<BeamState> {
  FourthTabLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('fourth'),
          title: 'Fourth',
          type: BeamPageType.noTransition,
          child: FourthTabScreen(),
        ),
      ];
}

// APP
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late int currentIndex;

  final routerDelegates = [
    BeamerDelegate(
      initialPath: '/first',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('first')) {
          return FirstTabLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/seconds',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('seconds')) {
          return SecondTabLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/third',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('third')) {
          return ThirdTabLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/fourth',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('fourth')) {
          return FourthTabLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;

    currentIndex = uriString.contains('first')
        ? 0
        : currentIndex = uriString.contains('seconds')
            ? 1
            : currentIndex = uriString.contains('third') ? 2 : 3;
  }

  @override
  Widget build(BuildContext context) {
    print('зашли в AppScreen');
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          Beamer(
            routerDelegate: routerDelegates[0],
          ),

          Beamer(
            routerDelegate: routerDelegates[1],
          ),

          Beamer(
            routerDelegate: routerDelegates[2],
          ),

          Beamer(
            routerDelegate: routerDelegates[3],
          ),
          //  ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        curve: Curves.ease,
        selectedColorOpacity: 0.5,
        selectedItemColor: Colors.purple,
        currentIndex: currentIndex,
        items: [
          SalomonBottomBarItem(
              title: const Text('Jeu'), icon: const Icon(Icons.filter_vintage)),
          SalomonBottomBarItem(
              title: const Text('History'),
              icon: const Icon(Icons.history_edu)),
          SalomonBottomBarItem(
              title: const Text('Notifications'),
              icon: const Icon(Icons.notifications_active)),
          SalomonBottomBarItem(
              title: const Text('Profile'), icon: const Icon(Icons.person)),
        ],
        onTap: (index) {
          if (index != currentIndex) {
            setState(() => currentIndex = index);
            routerDelegates[currentIndex].update(rebuild: false);
          }
        },
      ),
    );
  }
}

class MyBeamer extends StatelessWidget {
  MyBeamer({super.key});

  final routerDelegate = BeamerDelegate(
    initialPath: '/first',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (context, state, data) => const AppScreen(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    print('зашли в MyBeamer');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
    );
  }
}
