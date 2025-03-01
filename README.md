![https://api.buildwiththeta.com/storage/v1/object/public/theta-assets/covers/Theta_extended_negative-large%2019.svg](https://api.buildwiththeta.com/storage/v1/object/public/theta-assets/covers/Theta_extended_negative-large%2019.svg)

# [Build with Theta](https://buildwiththeta.com)

## The open source way of designing remote UI

Build your remote design system effortlessly, without writing code. Seamlessly integrate it into your codebase alongside your preferred packages, enabling easy UI updates without the need to rebuild the entire app.

- Documentation: https://docs.buildwiththeta.com

## Why Theta?

Theta simplifies the creation and maintenance of remote design systems. It allows the user interface of front-end applications on different platforms to be updated in real time from a central cloud, eliminating the need for users to download a new version. 

Remote design systems focus on creating dynamic user interfaces (UIs) that can be updated in real-time via APIs. Instead of hardcoding design components into the app, they are stored remotely. This allows central updates that are propagated instantly across all instances of the app, without the need for user downloads.

Theta offers several advantages:

- **Flexibility and Control:** Theta provides a no-code environment for designing the UI, but it doesn’t limit what you can do with the rest of your app. Developers can implement actions in whatever way they see fit, using the technologies they’re most comfortable with.
- **Mixing No-Code and Local Code:** Developers using Theta can override each node with their widgets, leveraging any technology stack. This approach enables a high degree of customization and flexibility, which is usually unavailable with traditional no-code solutions.
- **Team Collaboration and Version Control:** Theta provides tools for team collaboration, project logs, and branches, facilitating efficient teamwork in app development. The version control feature allows tracking and management of different versions of the app, a crucial aspect for maintaining app quality and addressing bugs or issues.
- **Efficiency:** Remote design systems like Theta allow for design updates to be rolled out instantly via API, across all instances of the app. This bypasses the traditional cycle of updating and downloading new app versions.
- **Consistency:** Because the design system is centralized, it ensures a consistent look and feel across all platforms, enhancing the user experience.
- **Future-Proof:** Remote design systems are not only adaptable to new design trends but also to changes in technology. As your app grows and evolves, you can update your UI without being constrained by a no-code platform’s limitations.

## Getting Started with Theta

To begin your Theta journey, follow these steps:

### 1. Sign Up

1. To begin your Theta journey, sign up for Theta on the [buildwiththeta.com](https://buildwiththeta.com) website.
2. Please note that an invite is required during the closed beta phase.
3. Feel free to join our community on [Discord](https://discord.com/invite/xNgDkZ2g6w) for discussions and support.

### 2. Create a New Project

1. After signing up, create a new project on the Theta platform.
2. Design your first interface by adding and arranging UI components to your liking.

### 3. Get Your API Key

1. To interact with your project, you'll need to obtain your API key from the project settings.
2. Save this API key in a safe place, as you'll need it for the next steps.

### 4. Set Your Anon Key

1. Inside your project at app.buildwiththeta.com, you'll find your Anon Key.
2. Ensure you add this key to your Flutter project to authenticate your app with Theta.

### 5. Create a New Flutter Project

1. Now, create a new Flutter project using your favorite IDE.

### 6. Modify `main.dart`

1. Update your `main.dart` with the following code:

```dart
import 'package:flutter/material.dart';
import 'package:theta/theta.dart';

Future<void> main() async {
  await Theta.initialize(
    cacheEnabled: false,
    anonKey: 'YOUR_ANON_KEY',
  );

  runApp(
    const ThetaProvider(
      theme: ThemeMode.light,
      child: MaterialApp(
        title: 'Theta Example App',
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UIBox(
        'Homepage', // Component name
        placeholder: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
```

2. Replace `'YOUR_ANON_KEY'` with your actual Anon Key.

### 7. Install Theta Client Library

1. Install the Theta client library by running the following command in your Flutter project:

```bash
flutter pub add theta
```

### 8. Run Your App

1. Now, you can run your app using the Chrome browser:

```bash
flutter run -d chrome
```

2. Your app should now be running with the Theta UI component specified in the `UIBox` widget.

Congratulations! You've taken the first steps towards leveraging the power of Theta to create a unique and customized user experience in your Flutter app. Keep exploring the possibilities, and don't hesitate to consult the Theta documentation for more advanced features and customization options. Happy coding!

## Support
- [GitHub Discussions](https://github.com/buildwiththeta/buildwiththeta/discussions): Ideal for general questions, Q&A, product use assistance, best practice discussions.
- [GitHub Issues](https://github.com/buildwiththeta/buildwiththeta/issues): Ideal for reporting bugs and problems while using Theta
- Email Support: Ideal for reporting problems with your personal projects.
- [Discord](https://discord.gg/xNgDkZ2g6w): Ideal for sharing projects and portfolios with the community. Only for invited users.

## Supported Frameworks
- [x] Flutter: ready on [pub.dev](https://pub.dev/packages/theta).
- [ ] Swift: work in progress. See [buildwiththeta-swift](https://github.com/buildwiththeta/buildwiththeta-swift)

## Status
- [x] Alpha: Experimental. Under intense development.
- [x] Closed Beta: Still under development. Except bugs and errors.

Check [Releases](https://github.com/buildwiththeta/buildwiththeta/releases) to see our current status and all updates.

## Architecture

<img src="https://fftefqqvfkkewuokofds.supabase.co/storage/v1/object/public/theta-assets/Architecture-min.jpg" />

In this repository you can find:

- [x] Theta Studio: UI web editor. Available in `/playgroud`. See it in action on [buildwiththeta.com](https://buildwiththeta.com)
- [x] Theta Flutter library. [Pub.dev](https://pub.dev/packages/theta)
- [x] Models.
- [x] Analytics.
- [x] Rendering.
- [x] Design System.
- [x] Widgets.  

All packages, except the one for the Studio, are available at Pub.dev.

---

## Supporters 💙

- [@chaplaindan](https://github.com/chaplaindan)

## Contributing

See [CONTRIBUTING.md](https://github.com/buildwiththeta/buildwiththeta/blob/main/CONTRIBUTING.md) for details.

## License

Build with Theta packages are licensed under the Apache License 2.0. See [LICENSE](https://github.com/buildwiththeta/buildwiththeta/blob/main/LICENSE) for details.

## Languages supported in docs

- [en](https://docs.page/buildwiththeta/buildwiththeta/en)
- [it](https://docs.page/buildwiththeta/buildwiththeta/it)
- [es](https://docs.page/buildwiththeta/buildwiththeta/es)
- [tr](https://docs.page/buildwiththeta/buildwiththeta/tr)

## Resources

- [▶️ Video tutorial](https://www.youtube.com/watch?v=oFed0NIqBZI)
- [⚡️ Website](https://buildwiththeta.com)
- [🧑‍🏫 Documentation](https://docs.page/buildwiththeta/buildwiththeta/)
- [🐱 GitHub](https://github.com/buildwiththeta/buildwiththeta)
- [🐦 Twitter](https://twitter.com/buildwiththeta)
- [👾 Discord](https://discord.gg/xNgDkZ2g6w)

![](https://fftefqqvfkkewuokofds.supabase.co/storage/v1/object/public/theta-assets/covers/banner-email-min.png)
