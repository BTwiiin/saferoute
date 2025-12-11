## Technical Overview

### Stack
- Flutter with Material 3, light/dark themes, and Riverpod for state management
- Dio HTTP client with custom auth interceptor and token refresh flow
- Flutter Secure Storage for persisted auth sessions
- Localization (EN/RU) via Flutter gen-l10n
- Auth integrations: email/password + Google + Apple (backed by custom backend)

### Architecture & Modules
- Feature-first structure under `lib/features/` (auth, alerts, map) using `presentation/application/domain/data` layers.
- Core theming, reusable widgets, and utilities live under `lib/core/`.
- Root composition: `main.dart` wires themes/locales; `root_page.dart` swaps between `LoginPage` and `SafeRouteHomePage` based on auth state.

### Networking & Auth
- `auth_api_service.dart` wraps login/register and provider-specific endpoints against your auth service.
- `auth_interceptor.dart` attaches `Bearer` tokens and retries on 401 by refreshing tokens; falls back to logout on failure.
- Sessions (access/refresh + user profile) are stored securely via `AuthTokenStorage` (Flutter Secure Storage).

### UI Surface
- Login/registration flows with social buttons and gradient backgrounds.
- Home screen placeholder includes safety score, alerts count, weather indicator, and a future navigation entry point.
- Bottom navigation prepared for home, routes, alerts, and profile sections.

### Standout Capabilities (current or planned)
- Community-sourced hazard alerts rendered on the map and summarized in the safety card.
- Safety score to quickly judge route risk level.
- Real-time notifications for nearby hazards and critical updates (via platform notifications).
- Offline-friendly session handling; network connectivity service stubbed for future robustness.
