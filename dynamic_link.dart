/// ------------------ DYNAMIC LINK EXAMPLE ---------------------------

Future<void> _firstLaunch() async {
  final PendingDynamicLinkData? data =
      await FirebaseDynamicLinks.instance.getInitialLink();
  final Uri? deepLink = data?.link;
  if (deepLink != null) {
    if (deepLink.queryParameters.containsKey('present')) {
      await localSource.setReferralUserIdr(
        deepLink.queryParameters['present'] ?? '',
      );
    }
  }
}

void _dynamicLinks() {
  _initLinks = FirebaseDynamicLinks.instance.onLink.listen(
    (event) async {
      final Uri deeplink = event.link;
      if (deeplink.queryParameters.containsKey('present')) {
        await localSource.setReferralUserIdr(
          deeplink.queryParameters['present'] ?? '',
        );
      }
    },
  );
}
