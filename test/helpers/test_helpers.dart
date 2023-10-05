import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/services/create_new_user_service.dart';
import 'package:whatsapp_stacked_architecture/services/login_service_service.dart';
import 'package:whatsapp_stacked_architecture/services/fetch_user_list_service.dart';
import 'package:whatsapp_stacked_architecture/services/chat_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CreateNewUserService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginServiceService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FetchUserListService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ChatService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SnackbarService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterCreateNewUserService();
  getAndRegisterLoginServiceService();
  getAndRegisterFetchUserListService();
  getAndRegisterChatService();
  getAndRegisterSnackbarService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockCreateNewUserService getAndRegisterCreateNewUserService() {
  _removeRegistrationIfExists<CreateNewUserService>();
  final service = MockCreateNewUserService();
  locator.registerSingleton<CreateNewUserService>(service);
  return service;
}

MockLoginServiceService getAndRegisterLoginServiceService() {
  _removeRegistrationIfExists<LoginServiceService>();
  final service = MockLoginServiceService();
  locator.registerSingleton<LoginServiceService>(service);
  return service;
}

MockFetchUserListService getAndRegisterFetchUserListService() {
  _removeRegistrationIfExists<FetchUserListService>();
  final service = MockFetchUserListService();
  locator.registerSingleton<FetchUserListService>(service);
  return service;
}

MockChatService getAndRegisterChatService() {
  _removeRegistrationIfExists<ChatService>();
  final service = MockChatService();
  locator.registerSingleton<ChatService>(service);
  return service;
}


// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}