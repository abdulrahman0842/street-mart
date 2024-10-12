# Street Mart

Street Mart is a Flutter-based product listing app designed to promote local vendors and businesses. Users can share pictures and descriptions of products they’ve purchased from local shops, which other users can view, helping to boost visibility for these businesses. The app integrates user authentication, authorization, and product sharing via APIs and supports offline viewing with a local database.

## Features

- **Product Sharing:** Users can share photos of products they've bought from local vendors with descriptions and vendor/shop locations.
- **Vendor Promotion:** Helps promote local businesses by allowing users to share their purchases.
- **User Authentication:** API-based authentication and authorization with secure storage of credentials using `SharedPreferences`.
- **Offline Mode:** View previously loaded products even when offline, powered by Hive for local storage.
- **State Management:** `Provider` used for efficient state management across the app.
- **Future Updates:**
  - Comment section for product posts.
  - Follow feature to let users follow each other.
  - Real-time chat between users.

## Backend

The backend of this application, including user authentication, authorization, and product sharing APIs, has been developed by [MdHassan07](https://github.com/MohammedHassan07/). You can check out the backend repository [here](https://github.com/MohammedHassan07/local-vendors).

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio/VS Code
- An API server (Backend developed by MdHassan07)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/abdulrahman0842/street_mart.git
2. Navigate to the project directory:
   ```bash
   cd street_mart
3. Get dependencies:
   ```bash
   flutter pub get
5. Configure the API server URL in your app’s environment.
6. Run the app:
   ```bash
   flutter run
