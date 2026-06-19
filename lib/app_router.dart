import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'splash_page.dart';
import 'notes_home_page.dart';
import 'note_detail_page.dart';
import 'note_edit_page.dart';
import 'profile_page.dart';
import 'about_page.dart';
import 'main_scaffold.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const NotesHomePage(),
              routes: [
                GoRoute(
                  path: 'note/:id',
                  pageBuilder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return CustomTransitionPage(
                      key: state.pageKey,
                      child: NoteDetailPage(noteId: id),
                      transitionDuration: const Duration(milliseconds: 300),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          )),
                          child: child,
                        );
                      },
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      pageBuilder: (context, state) {
                        final id = state.pathParameters['id']!;
                        return CustomTransitionPage(
                          key: state.pageKey,
                          child: NoteEditPage(noteId: id),
                          transitionDuration:
                              const Duration(milliseconds: 300),
                          transitionsBuilder: (context, animation,
                              secondaryAnimation, child) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/about',
              builder: (context, state) => const AboutPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);