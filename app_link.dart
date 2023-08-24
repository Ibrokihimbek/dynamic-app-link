/// ----------------------------- APP LINK EXAMPLE --------------------------

Future<void> _initUniLinks() async {
  _streamUniLink = _appLinks.uriLinkStream.listen(
    (uniLink) {
      if (uniLink.toString().contains('scan')) {
        Navigator.pushNamed(
          rootNavigatorKey.currentContext!,
          Routes.orderWithoutScanner,
          arguments: uniLink.toString().substring(
                uniLink.toString().length - 6,
              ),
        );
      }
    },
  );
}
