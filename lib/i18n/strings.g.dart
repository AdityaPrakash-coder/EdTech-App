
/*
 * Generated file. Do not edit.
 *
 * Locales: 13
 * Strings: 1495 (115.0 per locale)
 *
 * Built on 2022-07-11 at 07:50 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	as, // 'as'
	bn, // 'bn'
	gu, // 'gu'
	hi, // 'hi'
	kn, // 'kn'
	ma, // 'ma'
	mr, // 'mr'
	od, // 'od'
	pn, // 'pn'
	tl, // 'tl'
	tm, // 'tm'
	ur, // 'ur'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsAs _translationsAs = _StringsAs.build();
late _StringsBn _translationsBn = _StringsBn.build();
late _StringsGu _translationsGu = _StringsGu.build();
late _StringsHi _translationsHi = _StringsHi.build();
late _StringsKn _translationsKn = _StringsKn.build();
late _StringsMa _translationsMa = _StringsMa.build();
late _StringsMr _translationsMr = _StringsMr.build();
late _StringsOd _translationsOd = _StringsOd.build();
late _StringsPn _translationsPn = _StringsPn.build();
late _StringsTl _translationsTl = _StringsTl.build();
late _StringsTm _translationsTm = _StringsTm.build();
late _StringsUr _translationsUr = _StringsUr.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.as: return _translationsAs;
			case AppLocale.bn: return _translationsBn;
			case AppLocale.gu: return _translationsGu;
			case AppLocale.hi: return _translationsHi;
			case AppLocale.kn: return _translationsKn;
			case AppLocale.ma: return _translationsMa;
			case AppLocale.mr: return _translationsMr;
			case AppLocale.od: return _translationsOd;
			case AppLocale.pn: return _translationsPn;
			case AppLocale.tl: return _translationsTl;
			case AppLocale.tm: return _translationsTm;
			case AppLocale.ur: return _translationsUr;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.as: return _StringsAs.build();
			case AppLocale.bn: return _StringsBn.build();
			case AppLocale.gu: return _StringsGu.build();
			case AppLocale.hi: return _StringsHi.build();
			case AppLocale.kn: return _StringsKn.build();
			case AppLocale.ma: return _StringsMa.build();
			case AppLocale.mr: return _StringsMr.build();
			case AppLocale.od: return _StringsOd.build();
			case AppLocale.pn: return _StringsPn.build();
			case AppLocale.tl: return _StringsTl.build();
			case AppLocale.tm: return _StringsTm.build();
			case AppLocale.ur: return _StringsUr.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.as: return 'as';
			case AppLocale.bn: return 'bn';
			case AppLocale.gu: return 'gu';
			case AppLocale.hi: return 'hi';
			case AppLocale.kn: return 'kn';
			case AppLocale.ma: return 'ma';
			case AppLocale.mr: return 'mr';
			case AppLocale.od: return 'od';
			case AppLocale.pn: return 'pn';
			case AppLocale.tl: return 'tl';
			case AppLocale.tm: return 'tm';
			case AppLocale.ur: return 'ur';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.as: return const Locale.fromSubtags(languageCode: 'as');
			case AppLocale.bn: return const Locale.fromSubtags(languageCode: 'bn');
			case AppLocale.gu: return const Locale.fromSubtags(languageCode: 'gu');
			case AppLocale.hi: return const Locale.fromSubtags(languageCode: 'hi');
			case AppLocale.kn: return const Locale.fromSubtags(languageCode: 'kn');
			case AppLocale.ma: return const Locale.fromSubtags(languageCode: 'ma');
			case AppLocale.mr: return const Locale.fromSubtags(languageCode: 'mr');
			case AppLocale.od: return const Locale.fromSubtags(languageCode: 'od');
			case AppLocale.pn: return const Locale.fromSubtags(languageCode: 'pn');
			case AppLocale.tl: return const Locale.fromSubtags(languageCode: 'tl');
			case AppLocale.tm: return const Locale.fromSubtags(languageCode: 'tm');
			case AppLocale.ur: return const Locale.fromSubtags(languageCode: 'ur');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'as': return AppLocale.as;
			case 'bn': return AppLocale.bn;
			case 'gu': return AppLocale.gu;
			case 'hi': return AppLocale.hi;
			case 'kn': return AppLocale.kn;
			case 'ma': return AppLocale.ma;
			case 'mr': return AppLocale.mr;
			case 'od': return AppLocale.od;
			case 'pn': return AppLocale.pn;
			case 'tl': return AppLocale.tl;
			case 'tm': return AppLocale.tm;
			case 'ur': return AppLocale.ur;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsHomepageEn homepage = _StringsHomepageEn._(_root);
	late final _StringsStudentmodeEn studentmode = _StringsStudentmodeEn._(_root);
	late final _StringsManagestudentsEn managestudents = _StringsManagestudentsEn._(_root);
	late final _StringsAllocatecontentEn allocatecontent = _StringsAllocatecontentEn._(_root);
	late final _StringsTakeattendanceEn takeattendance = _StringsTakeattendanceEn._(_root);
	late final _StringsReviewEn review = _StringsReviewEn._(_root);
	late final _StringsAssessmentEn assessment = _StringsAssessmentEn._(_root);
}

// Path: homepage
class _StringsHomepageEn {
	_StringsHomepageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get studentmode => 'Student Mode';
	String get takeattendance => 'Take Attendance';
	String get allocatecontent => 'Allocate\nContent';
	String get review => 'Review';
	String get managestudent => 'Manage\nStudent';
	String get logout => 'Log Out';
	String get assessment => 'Assessment';
	String get loadsampledata => 'Load Data';
	String get ekal => 'Ekal Acharya';
	String get synced => 'data successfully sent to the server';
	String get notsynced => 'Synced not possible please try to connect to internet and try again';
	String get loadeddata => 'Loaded Data Successfully';
	String get logoutwarning => 'Are you sure you want to logout?';
	String get yes => 'Yes';
	String get no => 'No';
	String get attention => 'Attention!';
	String get syncdata => 'You are successfully added the data do not forgot to sync the data';
}

// Path: studentmode
class _StringsStudentmodeEn {
	_StringsStudentmodeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get studentmode => 'Student Mode';
	String get selectdate => 'Select Date:   ';
	String get nocontent => 'No Allocated Content Found';
	String get selectgat   => 'Select a Gat to proceed further:';
	String get videoname => 'Video Name';
	String get gat => 'Gat';
	String get subject => 'Subject';
	String get topic => 'Topic';
	String get watch => 'Watch Video';
	String get nocontentforgat => 'No Allocated Content Found for the selected Gat\n\nPlease Allocate content first';
	String get deletecontent => 'Delete a Allocated content';
	String get deletewarning => 'Are you sure you want to delete this Allocated Content ?';
	String get no => 'No';
	String get yes => 'Yes';
}

// Path: managestudents
class _StringsManagestudentsEn {
	_StringsManagestudentsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get managestudents => 'Manage Students';
	String get search => 'Search';
	String get notfound => 'No Results Found';
	String get addnew => 'Add New Student';
	String get age => 'Age: ';
	String get cancel => 'Cancel';
	String get submit => 'Submit';
	String get name => 'Name of Student';
	String get editstudent => 'Edit Student Details';
	String get deletestudent => 'Delete Student Details';
	String get deletestudentwarning => 'Do you want to delete the records for this child?';
	String get delete => 'Delete';
	String get gat => 'Gat: ';
	String get studentadded => 'The student has been added successfully';
}

// Path: allocatecontent
class _StringsAllocatecontentEn {
	_StringsAllocatecontentEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get allocatecontent => 'Allocate Content';
	String get selectgat => 'Select Gat';
	String get selecttopic => 'Select Topic';
	String get selectvideos => 'Select Videos';
	String get selectedvideos => 'Selected Videos';
	String get dateofcontent => 'Please select a date to allocate the content';
	String get selectdate => 'Select Date:   ';
}

// Path: takeattendance
class _StringsTakeattendanceEn {
	_StringsTakeattendanceEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get takeattendance => 'Take Attendance';
	String get date => 'Date:  ';
	String get dashboard => 'DashBoard';
	String get selectgat => 'Please Select a Gat';
	String get selectdate => 'Select Date';
	String get save => 'Save';
	String get attendancenottaken => 'Attendance Not Taken';
	String get nostudent => 'No student is register for this Gat!';
	String get holiday => 'Today is Holiday';
	String get confirmattendance => 'Confirm Attendance';
	String get confirmwarning => 'Please confirm that you want to submit this attendance';
	String get cancel => 'Cancel';
	String get ok => 'ok';
	String get attendancetaken => 'Attendance already taken';
	String get takenwarning => 'You have already taken the attendance for that gat today';
}

// Path: review
class _StringsReviewEn {
	_StringsReviewEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get review => 'Review';
	String get selectmonth => 'Select Month: ';
	String get selectgat => 'Please Select a Gat';
	String get attendancereview => 'Attendance Review';
	String get quizreview => 'Quiz Review';
	String get videoprog => 'Video Progress';
	String get selectstudent => 'Please Select a Student';
	String get nodata => 'No Data to Show for the Selected Fields';
	String get noquizgiven => 'No Quizzes Given';
	String get videono => 'Video No.';
	String get topic => 'Topic';
	String get duration => 'Duration';
	String get progress => 'Progress';
	String get noattendance => 'Attendance not Taken';
}

// Path: assessment
class _StringsAssessmentEn {
	_StringsAssessmentEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get createquiz => 'Create Quiz';
	String get createqs => 'Create Questions';
	String get createqzs => 'Create Quizzes';
	String get allqzs => 'All Quizzes';
	String get giveqz => 'Give Quiz';
	String get selectgat => 'Select Gat:  ';
	String get selecttopic => 'Select Topic:  ';
	String get enterq => 'Enter Question';
	String get enteroptiona => 'Enter Option A';
	String get enteroptionb => 'Enter Option B';
	String get enteroptionc => 'Enter Option C';
	String get enteroptiond => 'Enter Option D';
	String get choosea => 'Choose Answer';
	String get optiona => 'Option A';
	String get optionb => 'Option B';
	String get optionc => 'Option C';
	String get optiond => 'Option D';
	String get selectqs => '   Select Questions   ';
	String get selectatleastoneq => 'Please select at least one question';
	String get noqs => 'No Questions to Display';
	String get makequizwarning => 'Are you sure you want to make a quiz out of the selected questions?';
	String get selectdate => 'Select Date:   ';
	String get qztime => 'Total Quiz Time:   ';
	String get cancel => 'Cancel';
	String get qzcreated => 'The quiz has been created successfully';
	String get noqzs => 'No Quizzes to show !!';
	String get selectqz => 'Select a Quiz';
	String get listogqzs => 'List Of All Quizzes';
	String get noqzsmade => 'No Quizzes Made Yet';
	String get gat => 'Gat : ';
	String get date => 'Date :  ';
	String get deleteqzs => 'Delete a Quiz';
	String get deleteqzwarning => 'Are you sure you want to delete this Allocated Quiz ?';
	String get ok => 'ok';
}

// Path: <root>
class _StringsAs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAs.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsAs _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageAs     homepage = _StringsHomepageAs._(_root);
	@override late final _StringsStudentmodeAs     studentmode = _StringsStudentmodeAs._(_root);
	@override late final _StringsManagestudentsAs     managestudents = _StringsManagestudentsAs._(_root);
	@override late final _StringsAllocatecontentAs     allocatecontent = _StringsAllocatecontentAs._(_root);
	@override late final _StringsTakeattendanceAs     takeattendance = _StringsTakeattendanceAs._(_root);
	@override late final _StringsReviewAs     review = _StringsReviewAs._(_root);
	@override late final _StringsAssessmentAs     assessment = _StringsAssessmentAs._(_root);
}

// Path:     homepage
class _StringsHomepageAs implements _StringsHomepageEn {
	_StringsHomepageAs._(this._root);

	@override final _StringsAs _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' শিক্ষাৰ্থী মোড';
	@override String get         takeattendance => ' উপস্থিতি লওক';
	@override String get         allocatecontent => ' সমল আবন্টন কৰক';
	@override String get         review => ' পৰ্যালোচনা';
	@override String get         managestudent => ' শিক্ষাৰ্থী পৰিচালনা কৰক';
	@override String get         logout => ' লগ আউট কৰক';
	@override String get         assessment => ' মূল্যায়ন';
	@override String get         loadsampledata => ' তথ্য লোড কৰক';
	@override String get         ekal => ' একল আচাৰ্য';
	@override String get         synced => ' সাৰ্ভাৰলৈ সফলতাৰে প্ৰেৰণ কৰা তথ্য';
	@override String get         notsynced => ' চিংক কৰা সম্ভৱ নহয় অনুগ্ৰহ কৰি ইণ্টাৰনেটলৈ সংযোগ কৰিবলৈ চেষ্টা কৰক আৰু পুনৰ চেষ্টা কৰক';
	@override String get         loadeddata => ' সফলতাৰে লোড কৰা তথ্য';
	@override String get         logoutwarning => ' আপুনি লগআউট কৰিব বিচাৰে বুলি নিশ্চিতনে?';
	@override String get         yes => ' হয়';
	@override String get         no => ' নহয়';
	@override String get         attention => ' মনোযোগ!';
	@override String get         syncdata => ' আপোনাক সফলতাৰে যোগ কৰা হৈছে ডাটা চিংক কৰিবলৈ পাহৰি নাযায়';
}

// Path:     studentmode
class _StringsStudentmodeAs implements _StringsStudentmodeEn {
	_StringsStudentmodeAs._(this._root);

	@override final _StringsAs _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' শিক্ষাৰ্থী মোড';
	@override String get         selectdate => ' তাৰিখ বাছক';
	@override String get         nocontent => ' কোনো আৱণ্টিত সমল পোৱা নগ\'ল';
	@override String get         selectgat => ' আগলৈ আগবাঢ়িবলৈ এটা গাট বাছনি কৰক';
	@override String get         videoname => ' ভিডিঅ\' নাম';
	@override String get         gat => ' গাট';
	@override String get         subject => ' বিষয়';
	@override String get         topic => ' বিষয়';
	@override String get         watch => ' ভিডিঅ\' চাওক';
	@override String get         nocontentforgat => ' নিৰ্বাচিত গেটৰ বাবে কোনো আৱণ্টিত সমল পোৱা নগ\'ল অনুগ্ৰহ কৰি প্ৰথমে সমল আবণ্টন কৰক';
	@override String get         deletecontent => ' আবন্টিত সমল এটা বিলোপ কৰক';
	@override String get         deletewarning => ' আপুনি এই আৱণ্টিত সমল বিলোপ কৰিব বিচাৰে বুলি নিশ্চিতনে?';
	@override String get         no => ' নহয়';
	@override String get         yes => ' হয়';
}

// Path:     managestudents
class _StringsManagestudentsAs implements _StringsManagestudentsEn {
	_StringsManagestudentsAs._(this._root);

	@override final _StringsAs _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => '  শিক্ষাৰ্থীসকলক পৰিচালনা কৰক';
	@override String get         search => ' অনুসন্ধান';
	@override String get         notfound => ' কোনো ফলাফল পোৱা নগ\'ল';
	@override String get         addnew => ' নতুন শিক্ষাৰ্থী যোগ কৰক';
	@override String get         age => ' বয়স';
	@override String get         cancel => ' বাতিল কৰা';
	@override String get         submit => ' দাখিল কৰা';
	@override String get         name => ' শিক্ষাৰ্থীৰ নাম';
	@override String get         editstudent => ' শিক্ষাৰ্থীৰ বিৱৰণ সম্পাদনা কৰক';
	@override String get         deletestudent => ' শিক্ষাৰ্থীৰ বিৱৰণ বিলোপ কৰক';
	@override String get         deletestudentwarning => ' আপুনি এই শিশুটোৰ বাবে ৰেকৰ্ডবোৰ বিলোপ কৰিব বিচাৰে নেকি?';
	@override String get         delete => ' মচি পেলাওক';
	@override String get         gat => ' গাট';
	@override String get         studentadded => ' শিক্ষাৰ্থীজনক সফলতাৰে যোগ কৰা হৈছে';
}

// Path:     allocatecontent
class _StringsAllocatecontentAs implements _StringsAllocatecontentEn {
	_StringsAllocatecontentAs._(this._root);

	@override final _StringsAs _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => '   সমল আবন্টন কৰক';
	@override String get         selectgat => ' গাট বাছক';
	@override String get         selecttopic => ' বিষয় নিৰ্বাচন কৰক';
	@override String get         selectvideos => ' ভিডিঅ\' বাছক';
	@override String get         selectedvideos => ' নিৰ্বাচিত ভিডিঅ\'সমূহ';
	@override String get         dateofcontent => ' অনুগ্ৰহ কৰি সমল আবন্টন কৰিবলৈ তাৰিখ এটা বাছনি কৰক';
	@override String get         selectdate => ' তাৰিখ বাছক';
}

// Path:     takeattendance
class _StringsTakeattendanceAs implements _StringsTakeattendanceEn {
	_StringsTakeattendanceAs._(this._root);

	@override final _StringsAs _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => ' উপস্থিতি লওক';
	@override String get         date => ' তাৰিখ';
	@override String get         dashboard => ' ডেছবোৰ্ড';
	@override String get         selectgat => ' অনুগ্ৰহ কৰি এটা গাট বাছনি কৰক';
	@override String get         selectdate => ' তাৰিখ বাছক';
	@override String get         save => ' সংৰক্ষণ কৰক';
	@override String get         attendancenottaken => ' উপস্থিতি লোৱা হোৱা নাই';
	@override String get         nostudent => ' এই গাটৰ বাবে কোনো শিক্ষাৰ্থী পঞ্জীয়ন কৰা হোৱা নাই!';
	@override String get         holiday => ' আজি হলিডে';
	@override String get confirmattendance => 'উপস্থিতি নিশ্চিত কৰক';
	@override String get confirmwarning => 'অনুগ্ৰহ কৰি নিশ্চিত কৰক যে আপুনি এই উপস্থিতি দাখিল কৰিব বিচাৰে';
	@override String get cancel => 'বাতিল কৰা';
	@override String get ok => 'হ\'ব';
	@override String get attendancetaken => 'ইতিমধ্যে লোৱা উপস্থিতি';
	@override String get takenwarning => 'আপুনি ইতিমধ্যে সেই গাটৰ বাবে উপস্থিতি লৈছে';
}

// Path:     review
class _StringsReviewAs implements _StringsReviewEn {
	_StringsReviewAs._(this._root);

	@override final _StringsAs _root; // ignore: unused_field

	// Translations
	@override String get         review => '    পৰ্যালোচনা';
	@override String get         selectmonth => ' মাহ নিৰ্বাচন কৰক';
	@override String get         selectgat => ' অনুগ্ৰহ কৰি এটা গাট বাছনি কৰক';
	@override String get         attendancereview => ' উপস্থিতি পৰ্যালোচনা';
	@override String get         quizreview => ' কুইজ পৰ্যালোচনা';
	@override String get         videoprog => ' ভিডিঅ\' প্ৰগতি';
	@override String get         selectstudent => ' অনুগ্ৰহ কৰি এজন শিক্ষাৰ্থী বাছনি কৰক';
	@override String get         nodata => ' নিৰ্বাচিত ক্ষেত্ৰসমূহৰ বাবে দেখুৱাবলৈ কোনো ডাটা নাই';
	@override String get         noquizgiven => ' কোনো কুইজ দিয়া হোৱা নাই';
	@override String get         videono => ' ভিডিঅ\' নম্বৰ';
	@override String get         topic => ' বিষয়';
	@override String get         duration => ' সময়কাল';
	@override String get         progress => ' প্ৰগতি';
	@override String get         noattendance => ' উপস্থিতি লোৱা হোৱা নাই';
}

// Path:     assessment
class _StringsAssessmentAs implements _StringsAssessmentEn {
	_StringsAssessmentAs._(this._root);

	@override final _StringsAs _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => '      কুইজ সৃষ্টি কৰক';
	@override String get         createqs => '     প্ৰশ্ন সৃষ্টি কৰক';
	@override String get         createqzs => ' কুইজ সৃষ্টি কৰক';
	@override String get         allqzs => ' সকলো কুইজ';
	@override String get         giveqz => ' কুইজ দিয়ক';
	@override String get         selectgat => ' গাট বাছক';
	@override String get         selecttopic => ' বিষয় নিৰ্বাচন কৰক';
	@override String get         enterq => ' প্ৰশ্ন প্ৰবিষ্ট কৰক';
	@override String get         enteroptiona => ' বিকল্প এ প্ৰবিষ্ট কৰক';
	@override String get         enteroptionb => ' বিকল্প বি প্ৰবিষ্ট কৰক';
	@override String get         enteroptionc => ' বিকল্প চি প্ৰবিষ্ট কৰক';
	@override String get         enteroptiond => ' বিকল্প ডি প্ৰবিষ্ট কৰক';
	@override String get         choosea => ' উত্তৰ বাছক';
	@override String get         optiona => ' বিকল্প এ';
	@override String get         optionb => ' বিকল্প বি';
	@override String get         optionc => ' বিকল্প চি';
	@override String get         optiond => ' বিকল্প ঘ ';
	@override String get         selectqs => '    প্ৰশ্নসমূহ বাছনি কৰক   ';
	@override String get         selectatleastoneq => ' অনুগ্ৰহ কৰি কমেও এটা প্ৰশ্ন বাছনি কৰক';
	@override String get         noqs => ' প্ৰদৰ্শন কৰিবলৈ কোনো প্ৰশ্ন নাই';
	@override String get         makequizwarning => ' আপুনি বাছনি কৰা প্ৰশ্নবোৰৰ পৰা এটা কুইজ বনাব বিচাৰে বুলি নিশ্চিতনে?';
	@override String get         selectdate => ' তাৰিখ বাছক';
	@override String get         qztime => ' মুঠ কুইজ সময়';
	@override String get         cancel => ' বাতিল কৰা';
	@override String get         qzcreated => ' কুইজটো সফলতাৰে সৃষ্টি কৰা হৈছে';
	@override String get         noqzs => ' দেখুৱাবলৈ কোনো কুইজ নাই!!';
	@override String get         selectqz => ' এটা কুইজ বাছনি কৰক';
	@override String get         listogqzs => ' সকলো কুইজৰ তালিকা';
	@override String get         noqzsmade => ' এতিয়ালৈকে কোনো কুইজ বনোৱা হোৱা নাই';
	@override String get         gat => ' গাট ';
	@override String get         date => 'তাৰিখ ';
	@override String get         deleteqzs => ' কুইজ এটা বিলোপ কৰক';
	@override String get         deleteqzwarning => ' আপুনি এই আৱণ্টিত কুইজটো বিলোপ কৰিব বিচাৰে বুলি নিশ্চিতনে?';
	@override String get ok => 'হ\'ব';
}

// Path: <root>
class _StringsBn implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsBn.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsBn _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageBn     homepage = _StringsHomepageBn._(_root);
	@override late final _StringsStudentmodeBn     studentmode = _StringsStudentmodeBn._(_root);
	@override late final _StringsManagestudentsBn     managestudents = _StringsManagestudentsBn._(_root);
	@override late final _StringsAllocatecontentBn     allocatecontent = _StringsAllocatecontentBn._(_root);
	@override late final _StringsTakeattendanceBn     takeattendance = _StringsTakeattendanceBn._(_root);
	@override late final _StringsReviewBn     review = _StringsReviewBn._(_root);
	@override late final _StringsAssessmentBn     assessment = _StringsAssessmentBn._(_root);
}

// Path:     homepage
class _StringsHomepageBn implements _StringsHomepageEn {
	_StringsHomepageBn._(this._root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' ছাত্র মোড';
	@override String get         takeattendance => ' উপস্থিতি নিন';
	@override String get         allocatecontent => ' বিষয়বস্তু বরাদ্দ করুন';
	@override String get         review => ' পর্যালোচনা';
	@override String get         managestudent => ' ছাত্র পরিচালনা করুন';
	@override String get         logout => ' লগ আউট করুন';
	@override String get         assessment => ' মূল্যায়ন';
	@override String get         loadsampledata => ' ডাটা লোড করুন';
	@override String get         ekal => ' একল আচার্য';
	@override String get         synced => ' তথ্য সফলভাবে সার্ভারে পাঠানো হয়েছে';
	@override String get         notsynced => ' সিঙ্ক করা সম্ভব নয় অনুগ্রহ করে ইন্টারনেটে সংযোগ করার চেষ্টা করুন এবং আবার চেষ্টা করুন';
	@override String get         loadeddata => ' সফলভাবে লোড করা তথ্য';
	@override String get         logoutwarning => ' আপনি কি নিশ্চিত যে আপনি লগআউট করতে চান?';
	@override String get         yes => ' হ্যাঁ';
	@override String get         no => ' না';
	@override String get         attention => ' সাবধান!';
	@override String get         syncdata => ' আপনি সফলভাবে ডেটা যোগ করেছেন ডেটা সিঙ্ক করতে ভুলবেন না';
}

// Path:     studentmode
class _StringsStudentmodeBn implements _StringsStudentmodeEn {
	_StringsStudentmodeBn._(this._root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' ছাত্র মোড';
	@override String get         selectdate => ' তারিখ নির্বাচন করুন';
	@override String get         nocontent => ' কোনও বরাদ্দকৃত সামগ্রী খুঁজে পাওয়া যায়নি';
	@override String get         selectgat => ' আরও এগিয়ে যেতে একটি গ্যাট নির্বাচন করুন';
	@override String get         videoname => ' ভিডিওর নাম';
	@override String get         gat => ' গ্যাট';
	@override String get         subject => ' বিষয়শ্রেণী';
	@override String get         topic => ' বিষয়';
	@override String get         watch => ' ভিডিও দেখুন';
	@override String get         nocontentforgat => ' নির্বাচিত গ্যাটের জন্য কোনও বরাদ্দকৃত সামগ্রী পাওয়া যায়নি দয়া করে প্রথমে সামগ্রী বরাদ্দ করুন';
	@override String get         deletecontent => ' একটি বরাদ্দকৃত সামগ্রী মুছুন';
	@override String get         deletewarning => ' আপনি কি নিশ্চিত যে আপনি এই বরাদ্দকৃত সামগ্রীটি বিলোপ করতে চান?';
	@override String get         no => ' না';
	@override String get         yes => ' হ্যাঁ';
}

// Path:     managestudents
class _StringsManagestudentsBn implements _StringsManagestudentsEn {
	_StringsManagestudentsBn._(this._root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => ' শিক্ষার্থীদের পরিচালনা করুন';
	@override String get         search => ' সন্ধান';
	@override String get         notfound => ' কোনও ফলাফল খুঁজে পাওয়া যায়নি';
	@override String get         addnew => ' নতুন ছাত্র যোগ করুন';
	@override String get         age => ' বয়স';
	@override String get         cancel => ' বাতিল';
	@override String get         submit => ' জমা';
	@override String get         name => ' ছাত্রের নাম';
	@override String get         editstudent => ' শিক্ষার্থীর বিবরণ সম্পাদনা করুন';
	@override String get         deletestudent => ' শিক্ষার্থীর বিবরণ মুছুন';
	@override String get         deletestudentwarning => ' আপনি কি এই সন্তানের জন্য রেকর্ডগুলি মুছতে চান?';
	@override String get         delete => ' বিলোপ';
	@override String get         gat => ' গ্যাট';
	@override String get         studentadded => ' ছাত্রটি সফলভাবে যোগ করা হয়েছে';
}

// Path:     allocatecontent
class _StringsAllocatecontentBn implements _StringsAllocatecontentEn {
	_StringsAllocatecontentBn._(this._root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => ' বিষয়বস্তু বরাদ্দ করুন';
	@override String get         selectgat => ' গ্যাট নির্বাচন করুন';
	@override String get         selecttopic => ' বিষয় নির্বাচন করুন';
	@override String get         selectvideos => ' ভিডিওগুলি নির্বাচন করুন';
	@override String get         selectedvideos => ' নির্বাচিত ভিডিওসমূহ';
	@override String get         dateofcontent => ' অনুগ্রহ করে বিষয়বস্তু বরাদ্দ করার জন্য একটি তারিখ নির্বাচন করুন';
	@override String get         selectdate => ' তারিখ নির্বাচন করুন';
}

// Path:     takeattendance
class _StringsTakeattendanceBn implements _StringsTakeattendanceEn {
	_StringsTakeattendanceBn._(this._root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => ' উপস্থিতি নিন';
	@override String get         date => ' তারিখ';
	@override String get         dashboard => ' ড্যাশবোর্ড';
	@override String get         selectgat => ' অনুগ্রহ করে একটি গ্যাট নির্বাচন করুন';
	@override String get         selectdate => ' তারিখ নির্বাচন করুন';
	@override String get         save => ' সংরক্ষণ';
	@override String get         attendancenottaken => ' উপস্থিতি নেওয়া হয়নি';
	@override String get         nostudent => ' কোনও শিক্ষার্থী এই গ্যাটের জন্য নিবন্ধিত নয়!';
	@override String get         holiday => ' আজ ছুটির দিন';
	@override String get confirmattendance => 'উপস্থিতি নিশ্চিত করুন';
	@override String get confirmwarning => 'অনুগ্রহ করে নিশ্চিত করুন যে আপনি এই উপস্থিতি জমা দিতে চান';
	@override String get cancel => 'বাতিল';
	@override String get ok => 'ঠিক আছে';
	@override String get attendancetaken => 'উপস্থিতি ইতিমধ্যে গৃহীত হয়েছে';
	@override String get takenwarning => 'আপনি ইতিমধ্যে আজ সেই গ্যাটের জন্য উপস্থিতি গ্রহণ করেছেন';
}

// Path:     review
class _StringsReviewBn implements _StringsReviewEn {
	_StringsReviewBn._(this._root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get         review => '  পর্যালোচনা';
	@override String get         selectmonth => ' মাস নির্বাচন করুন';
	@override String get         selectgat => ' অনুগ্রহ করে একটি গ্যাট নির্বাচন করুন';
	@override String get         attendancereview => ' উপস্থিতি পর্যালোচনা';
	@override String get         quizreview => ' কুইজ পর্যালোচনা';
	@override String get         videoprog => ' ভিডিও প্রগতি';
	@override String get         selectstudent => ' অনুগ্রহ করে একজন ছাত্র নির্বাচন করুন';
	@override String get         nodata => ' নির্বাচিত ক্ষেত্রগুলির জন্য দেখানোর জন্য কোনও তথ্য নেই';
	@override String get         noquizgiven => ' কোনও ক্যুইজ দেওয়া হয়নি';
	@override String get         videono => ' ভিডিও নং।';
	@override String get         topic => ' বিষয়';
	@override String get         duration => ' স্থিতিকাল';
	@override String get         progress => ' প্রগতি';
	@override String get         noattendance => ' উপস্থিতি নেওয়া হয়নি';
}

// Path:     assessment
class _StringsAssessmentBn implements _StringsAssessmentEn {
	_StringsAssessmentBn._(this._root);

	@override final _StringsBn _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => ' কুইজ তৈরি করুন';
	@override String get         createqs => ' প্রশ্ন তৈরি করুন';
	@override String get         createqzs => ' ক্যুইজগুলি তৈরি করুন';
	@override String get         allqzs => ' সকল ক্যুইজ';
	@override String get         giveqz => ' কুইজ দিন';
	@override String get         selectgat => ' গ্যাট নির্বাচন করুন';
	@override String get         selecttopic => ' বিষয় নির্বাচন করুন';
	@override String get         enterq => ' প্রশ্ন লিখুন';
	@override String get         enteroptiona => ' বিকল্প A লিখুন';
	@override String get         enteroptionb => ' বিকল্প B লিখুন';
	@override String get         enteroptionc => ' বিকল্প C লিখুন';
	@override String get         enteroptiond => ' বিকল্প D লিখুন';
	@override String get         choosea => ' উত্তর চয়ন করুন';
	@override String get         optiona => ' বিকল্প A';
	@override String get         optionb => ' বিকল্প B';
	@override String get         optionc => ' বিকল্প C';
	@override String get         optiond => ' বিকল্প D ';
	@override String get         selectqs => '     প্রশ্ননির্বাচন করুন   ';
	@override String get         selectatleastoneq => ' অনুগ্রহ করে কমপক্ষে একটি প্রশ্ন নির্বাচন করুন';
	@override String get         noqs => ' প্রদর্শনের জন্য কোন প্রশ্ন নেই';
	@override String get         makequizwarning => ' আপনি কি নিশ্চিত যে আপনি নির্বাচিত প্রশ্নগুলি থেকে একটি কুইজ তৈরি করতে চান?';
	@override String get         selectdate => ' তারিখ নির্বাচন করুন';
	@override String get         qztime => ' মোট কুইজ সময়';
	@override String get         cancel => ' বাতিল';
	@override String get         qzcreated => ' কুইজটি সফলভাবে তৈরি করা হয়েছে';
	@override String get         noqzs => ' দেখানোর জন্য কোনও ক্যুইজ নেই !!';
	@override String get         selectqz => ' একটি কুইজ নির্বাচন করুন';
	@override String get         listogqzs => ' সকল ক্যুইজের তালিকা';
	@override String get         noqzsmade => ' এখনও কোনও ক্যুইজ তৈরি করা হয়নি';
	@override String get         gat => ' গ্যাট ';
	@override String get         date => 'তারিখ ';
	@override String get         deleteqzs => ' একটি কুইজ মুছুন';
	@override String get         deleteqzwarning => ' তুমি কি নিশ্চিত যে তুমি এই বরাদ্দকৃত ক্যুইজটি মুছতে চাও?';
	@override String get ok => 'ঠিক আছে';
}

// Path: <root>
class _StringsGu implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsGu.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsGu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageGu     homepage = _StringsHomepageGu._(_root);
	@override late final _StringsStudentmodeGu     studentmode = _StringsStudentmodeGu._(_root);
	@override late final _StringsManagestudentsGu     managestudents = _StringsManagestudentsGu._(_root);
	@override late final _StringsAllocatecontentGu     allocatecontent = _StringsAllocatecontentGu._(_root);
	@override late final _StringsTakeattendanceGu     takeattendance = _StringsTakeattendanceGu._(_root);
	@override late final _StringsReviewGu     review = _StringsReviewGu._(_root);
	@override late final _StringsAssessmentGu     assessment = _StringsAssessmentGu._(_root);
}

// Path:     homepage
class _StringsHomepageGu implements _StringsHomepageEn {
	_StringsHomepageGu._(this._root);

	@override final _StringsGu _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' વિદ્યાર્થી સ્થિતિ';
	@override String get         takeattendance => ' હાજરી લો';
	@override String get         allocatecontent => ' સમાવિષ્ટ ફાળવો';
	@override String get         review => ' રીવ્યુ';
	@override String get         managestudent => ' વિદ્યાર્થીનું સંચાલન કરો';
	@override String get         logout => ' બહાર નીકળો';
	@override String get         assessment => ' આકારણી';
	@override String get         loadsampledata => ' માહિતી લાવો';
	@override String get         ekal => ' એકલ આચાર્ય';
	@override String get         synced => ' માહિતી સફળતાપૂર્વક સર્વર પર મોકલેલ છે';
	@override String get         notsynced => ' સિંક કરવાનું શક્ય નથી કૃપા કરીને ઇન્ટરનેટ સાથે જોડાવાનો પ્રયાસ કરો અને ફરીથી પ્રયત્ન કરો';
	@override String get         loadeddata => ' લોડ થયેલ માહિતી સફળતાપૂર્વક';
	@override String get         logoutwarning => ' શું તમે ખરેખર બહાર નીકળવા માંગો છો?';
	@override String get         yes => ' હા';
	@override String get         no => ' ના';
	@override String get         attention => ' ધ્યાન!';
	@override String get         syncdata => ' તમે સફળતાપૂર્વક ઉમેરાયેલ છે ડેટા સિંક કરવાનું ભૂલશો નહિં';
}

// Path:     studentmode
class _StringsStudentmodeGu implements _StringsStudentmodeEn {
	_StringsStudentmodeGu._(this._root);

	@override final _StringsGu _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' વિદ્યાર્થી સ્થિતિ';
	@override String get         selectdate => ' તારીખ પસંદ કરો';
	@override String get         nocontent => ' ફાળવેલ સમાવિષ્ટ મળ્યુ નથી';
	@override String get         selectgat => ' આગળ વધવા માટે Gat પસંદ કરો';
	@override String get         videoname => ' વિડિઓ નામ';
	@override String get         gat => ' ગાટ';
	@override String get         subject => ' વિષય';
	@override String get         topic => ' વિષય';
	@override String get         watch => ' જુઓ વીડિયો';
	@override String get         nocontentforgat => ' પસંદ કરેલ ગેટ માટે કોઈ ફાળવેલ સામગ્રી મળી નથી કૃપા કરીને પહેલા સામગ્રી ફાળવો';
	@override String get         deletecontent => ' ફાળવેલ સામગ્રીને કાઢી નાંખો';
	@override String get         deletewarning => ' શું તમને ખાત્રી છે કે તમે આ ફાળવેલી સામગ્રીને ડીલીટ કરવા માગો છો?';
	@override String get         no => ' ના';
	@override String get         yes => ' હા';
}

// Path:     managestudents
class _StringsManagestudentsGu implements _StringsManagestudentsEn {
	_StringsManagestudentsGu._(this._root);

	@override final _StringsGu _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => ' વિદ્યાર્થીઓને મેનેજ કરો';
	@override String get         search => ' શોધવું';
	@override String get         notfound => ' પરિણામો મળ્યાં નથી';
	@override String get         addnew => ' નવો વિદ્યાર્થી ઉમેરો';
	@override String get         age => ' ઉમર';
	@override String get         cancel => ' રદ્દ';
	@override String get         submit => ' મોકલો';
	@override String get         name => ' વિદ્યાર્થીનું નામ';
	@override String get         editstudent => ' વિદ્યાર્થી વિગતોમાં ફેરફાર કરો';
	@override String get         deletestudent => ' વિદ્યાર્થી વિગતો કાઢી નાંખો';
	@override String get         deletestudentwarning => ' શું તમે આ બાળક માટેના રેકોર્ડ્સ કાઢી નાખવા માંગો છો?';
	@override String get         delete => ' કાઢી નાંખો';
	@override String get         gat => ' ગાટ';
	@override String get         studentadded => ' વિદ્યાર્થીને સફળતાપૂર્વક ઉમેરવામાં આવ્યો છે';
}

// Path:     allocatecontent
class _StringsAllocatecontentGu implements _StringsAllocatecontentEn {
	_StringsAllocatecontentGu._(this._root);

	@override final _StringsGu _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => ' સમાવિષ્ટ ફાળવો';
	@override String get         selectgat => ' ગેટ પસંદ કરો';
	@override String get         selecttopic => ' મુદ્દો પસંદ કરો';
	@override String get         selectvideos => ' વિડિયો પસંદ કરો';
	@override String get         selectedvideos => ' પસંદ થયેલ વિડિયો';
	@override String get         dateofcontent => ' કૃપા કરીને સામગ્રી ફાળવવા માટે તારીખ પસંદ કરો';
	@override String get         selectdate => ' તારીખ પસંદ કરો';
}

// Path:     takeattendance
class _StringsTakeattendanceGu implements _StringsTakeattendanceEn {
	_StringsTakeattendanceGu._(this._root);

	@override final _StringsGu _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => '  હાજરી લો';
	@override String get         date => ' તિથિ';
	@override String get         dashboard => ' ડેશબોર્ડ';
	@override String get         selectgat => ' કૃપા કરીને ગેટ પસંદ કરો';
	@override String get         selectdate => ' તારીખ પસંદ કરો';
	@override String get         save => ' સંગ્રહો';
	@override String get         attendancenottaken => ' હાજરી લેવાઈ નથી';
	@override String get         nostudent => ' આ ગેટ માટે કોઈ વિદ્યાર્થી રજીસ્ટર્ડ નથી!';
	@override String get         holiday => ' આજે રજા છે';
	@override String get confirmattendance => 'હાજરીની ખાતરી કરો';
	@override String get confirmwarning => 'કૃપા કરીને પુષ્ટિ કરો કે તમે આ હાજરી સબમિટ કરવા માંગો છો';
	@override String get cancel => 'રદ્દ';
	@override String get ok => 'બરાબર';
	@override String get attendancetaken => 'હાજરી પહેલેથી જ લીધેલ છે';
	@override String get takenwarning => 'તમે આજે તે ગેટ માટે હાજરી પહેલેથી જ લઈ લીધી છે';
}

// Path:     review
class _StringsReviewGu implements _StringsReviewEn {
	_StringsReviewGu._(this._root);

	@override final _StringsGu _root; // ignore: unused_field

	// Translations
	@override String get         review => '  રીવ્યુ';
	@override String get         selectmonth => ' મહિનો પસંદ કરો';
	@override String get         selectgat => ' કૃપા કરીને ગેટ પસંદ કરો';
	@override String get         attendancereview => ' હાજરી સમીક્ષા';
	@override String get         quizreview => ' ક્વિઝ સમીક્ષા';
	@override String get         videoprog => ' વિડિયો પ્રગતિ';
	@override String get         selectstudent => ' કૃપા કરીને કોઈ વિદ્યાર્થીને પસંદ કરો';
	@override String get         nodata => ' પસંદ કરેલ ક્ષેત્રો માટે બતાવવા માટે માહિતી નથી';
	@override String get         noquizgiven => ' કોઈ ક્વિઝ આપેલ નથી';
	@override String get         videono => ' વીડિયો નં.';
	@override String get         topic => ' વિષય';
	@override String get         duration => ' સમયગાળો';
	@override String get         progress => ' પ્રગતિ';
	@override String get         noattendance => ' હાજરી લીધેલ નથી';
}

// Path:     assessment
class _StringsAssessmentGu implements _StringsAssessmentEn {
	_StringsAssessmentGu._(this._root);

	@override final _StringsGu _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => ' ક્વિઝ બનાવો';
	@override String get         createqs => ' પ્રશ્નો બનાવો';
	@override String get         createqzs => ' ક્વિઝ બનાવો';
	@override String get         allqzs => ' બધી ક્વિઝ';
	@override String get         giveqz => ' ક્વિઝ આપો';
	@override String get         selectgat => ' Gat ને પસંદ કરો';
	@override String get         selecttopic => ' મુદ્દો પસંદ કરો';
	@override String get         enterq => ' પ્રશ્ન દાખલ કરો';
	@override String get         enteroptiona => ' વિકલ્પ A દાખલ કરો';
	@override String get         enteroptionb => ' વિકલ્પ બી દાખલ કરો';
	@override String get         enteroptionc => ' વિકલ્પ C દાખલ કરો';
	@override String get         enteroptiond => ' વિકલ્પ D દાખલ કરો';
	@override String get         choosea => ' જવાબ પસંદ કરો';
	@override String get         optiona => ' વિકલ્પ A';
	@override String get         optionb => ' વિકલ્પ B';
	@override String get         optionc => ' વિકલ્પ C';
	@override String get         optiond => ' વિકલ્પ D ';
	@override String get         selectqs => '    પ્રશ્નો પસંદ કરો';
	@override String get         selectatleastoneq => ' કૃપા કરીને ઓછામાં ઓછો એક પ્રશ્ન પસંદ કરો';
	@override String get         noqs => ' દર્શાવવા માટે કોઈ પ્રશ્નો નથી';
	@override String get         makequizwarning => ' શું તમને ખાત્રી છે કે તમે પસંદ કરેલા પ્રશ્નોમાંથી ક્વિઝ બનાવવા માગો છો?';
	@override String get         selectdate => ' તારીખ પસંદ કરો';
	@override String get         qztime => ' કુલ ક્વિઝ સમય';
	@override String get         cancel => ' રદ્દ';
	@override String get         qzcreated => ' ક્વિઝ સફળતાપૂર્વક બનાવવામાં આવી છે';
	@override String get         noqzs => ' !! બતાવવા માટે કોઈ ક્વિઝ નથી';
	@override String get         selectqz => ' ક્વિઝ પસંદ કરો';
	@override String get         listogqzs => ' બધી ક્વિઝની યાદી';
	@override String get         noqzsmade => ' હજી સુધી કોઈ ક્વિઝ બનાવવામાં આવી નથી';
	@override String get         gat => ' ગાટ ';
	@override String get         date => 'તિથિ ';
	@override String get         deleteqzs => ' ક્વિઝ કાઢી નાંખો';
	@override String get         deleteqzwarning => ' શું તમે ખરેખર આ ફાળવેલ ક્વિઝને ડિલીટ કરવા માગો છો?';
	@override String get ok => 'બરાબર';
}

// Path: <root>
class _StringsHi implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHi.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsHi _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageHi homepage = _StringsHomepageHi._(_root);
	@override late final _StringsStudentmodeHi studentmode = _StringsStudentmodeHi._(_root);
	@override late final _StringsManagestudentsHi managestudents = _StringsManagestudentsHi._(_root);
	@override late final _StringsAllocatecontentHi allocatecontent = _StringsAllocatecontentHi._(_root);
	@override late final _StringsTakeattendanceHi takeattendance = _StringsTakeattendanceHi._(_root);
	@override late final _StringsReviewHi review = _StringsReviewHi._(_root);
	@override late final _StringsAssessmentHi assessment = _StringsAssessmentHi._(_root);
}

// Path: homepage
class _StringsHomepageHi implements _StringsHomepageEn {
	_StringsHomepageHi._(this._root);

	@override final _StringsHi _root; // ignore: unused_field

	// Translations
	@override String get studentmode => 'छात्र मोड';
	@override String get takeattendance => 'उपस्थिति लेना';
	@override String get allocatecontent => 'सामग्री आबंटित \nकरना';
	@override String get review => 'समीक्षा';
	@override String get managestudent => 'प्रबंधित\nछात्र';
	@override String get logout => 'लॉग आउट';
	@override String get assessment => 'मूल्यांकन';
	@override String get loadsampledata => 'डेटा प्राप्त करना';
	@override String get ekal => 'एकल आचार्य';
	@override String get synced => 'सर्वर पर सफलतापूर्वक भेजा गया डेटा';
	@override String get notsynced => 'सिंक्रनाइज़ेशन संभव नहीं था कृपया इंटरनेट से कनेक्ट होने का प्रयास करें और पुन: प्रयास करें';
	@override String get loadeddata => 'लोड किया गया डेटा सफलतापूर्वक';
	@override String get logoutwarning => 'क्या आप वाकई लॉगआउट करना चाहते हैं?';
	@override String get yes => 'हाँ';
	@override String get no => 'नहीं';
	@override String get attention => 'ध्यान!';
	@override String get syncdata => 'आपने सफलतापूर्वक डेटा जोड़ा है. डेटा सिंक्रनाइज़ करना न भूलें';
}

// Path: studentmode
class _StringsStudentmodeHi implements _StringsStudentmodeEn {
	_StringsStudentmodeHi._(this._root);

	@override final _StringsHi _root; // ignore: unused_field

	// Translations
	@override String get studentmode => 'छात्र मोड';
	@override String get selectdate => 'दिनांक का चयन करें:   ';
	@override String get nocontent => 'कोई आबंटित सामग्री नहीं मिली';
	@override String get selectgat => 'आगे बढ़ने के लिए एक गैट का चयन करें:';
	@override String get videoname => 'वीडियो का नाम';
	@override String get gat => 'गट';
	@override String get subject => 'विषय';
	@override String get topic => 'उपविषय';
	@override String get watch => 'वीडियो देखें';
	@override String get nocontentforgat => 'चयनित गट के लिए कोई आबंटित सामग्री नहीं मिली\n\nकृपया पहले सामग्री आबंटित करें';
	@override String get deletecontent => 'आबंटित सामग्री हटाएँ';
	@override String get deletewarning => 'क्या आप वाकई इस आबंटित सामग्री को हटाना चाहते हैं ?';
	@override String get no => 'नहीं';
	@override String get yes => 'हाँ';
}

// Path: managestudents
class _StringsManagestudentsHi implements _StringsManagestudentsEn {
	_StringsManagestudentsHi._(this._root);

	@override final _StringsHi _root; // ignore: unused_field

	// Translations
	@override String get managestudents => 'प्रबंधित छात्र';
	@override String get search => 'खोजें';
	@override String get notfound => 'कोई परिणाम नहीं मिला';
	@override String get addnew => 'नया छात्र जोड़ें';
	@override String get age => 'उम्र: ';
	@override String get cancel => 'रद्द';
	@override String get submit => 'सबमिट';
	@override String get name => 'छात्र का नाम';
	@override String get editstudent => 'छात्र विवरण संपादित करें';
	@override String get deletestudent => 'छात्र विवरण हटाएँ';
	@override String get deletestudentwarning => 'क्या आप इस बच्चे के लिए रिकॉर्ड हटाना चाहते हैं?';
	@override String get delete => 'हटाएँ';
	@override String get gat => 'गट: ';
	@override String get studentadded => 'छात्र को सफलतापूर्वक जोड़ा गया है';
}

// Path: allocatecontent
class _StringsAllocatecontentHi implements _StringsAllocatecontentEn {
	_StringsAllocatecontentHi._(this._root);

	@override final _StringsHi _root; // ignore: unused_field

	// Translations
	@override String get allocatecontent => 'सामग्री आबंटित करना';
	@override String get selectgat => 'गट चयन करें';
	@override String get selecttopic => 'विषय का चयन';
	@override String get selectvideos => 'वीडियो का चयन';
	@override String get selectedvideos => 'चयनित वीडियो';
	@override String get dateofcontent => 'कृपया सामग्री आबंटित करने के लिए किसी दिनांक का चयन करें';
	@override String get selectdate => 'दिनांक का चयन करें:   ';
}

// Path: takeattendance
class _StringsTakeattendanceHi implements _StringsTakeattendanceEn {
	_StringsTakeattendanceHi._(this._root);

	@override final _StringsHi _root; // ignore: unused_field

	// Translations
	@override String get takeattendance => 'उपस्थिति लेना';
	@override String get date => 'दिनांक:  ';
	@override String get dashboard => 'डैशबोर्ड';
	@override String get selectgat => 'गट चयन करें';
	@override String get selectdate => 'दिनांक का चयन करें:';
	@override String get save => 'सहेजें';
	@override String get attendancenottaken => 'उपस्थिति नहीं ली गई';
	@override String get nostudent => 'कोई भी छात्र इस गैट के लिए पंजीकृत नहीं है!';
	@override String get holiday => 'आज छुट्टी है';
	@override String get confirmattendance => 'उपस्थिति की पुष्टि करें';
	@override String get confirmwarning => 'कृपया पुष्टि करें कि आप इस उपस्थिति को सबमिट करना चाहते हैं';
	@override String get cancel => 'रद्द';
	@override String get ok => 'ठीक है';
	@override String get attendancetaken => 'उपस्थिति पहले से ही ली गई है';
	@override String get takenwarning => 'आप पहले से ही है कि gat के लिए उपस्थिति ले लिया है आज';
}

// Path: review
class _StringsReviewHi implements _StringsReviewEn {
	_StringsReviewHi._(this._root);

	@override final _StringsHi _root; // ignore: unused_field

	// Translations
	@override String get review => 'समीक्षा';
	@override String get selectmonth => 'महीने का चयन करें: ';
	@override String get selectgat => 'गट चयन करें';
	@override String get attendancereview => 'उपस्थिति समीक्षा';
	@override String get quizreview => 'प्रश्नोत्तरी समीक्षा';
	@override String get videoprog => 'वीडियो प्रगति';
	@override String get selectstudent => 'कृपया एक छात्र का चयन करें';
	@override String get nodata => 'चयनित फ़ील्ड्स के लिए दिखाने के लिए कोई डेटा नहीं';
	@override String get noquizgiven => 'No Quizzes Given';
	@override String get videono => 'वीडियो नंबर ';
	@override String get topic => 'विषय';
	@override String get duration => 'अवधि';
	@override String get progress => 'प्रगति';
	@override String get noattendance => 'उपस्थिति नहीं ली गई ';
}

// Path: assessment
class _StringsAssessmentHi implements _StringsAssessmentEn {
	_StringsAssessmentHi._(this._root);

	@override final _StringsHi _root; // ignore: unused_field

	// Translations
	@override String get createquiz => 'प्रश्नोत्तरी बनाएँ';
	@override String get createqs => 'प्रश्न बनाएँ';
	@override String get createqzs => 'परीक्षा बनाएँ';
	@override String get allqzs => 'सभी प्रश्नोत्तरी';
	@override String get giveqz => 'प्रश्नोत्तरी दें';
	@override String get selectgat => 'गट चयन करें:  ';
	@override String get selecttopic => 'विषय का चयन:  ';
	@override String get enterq => 'प्रश्न दर्ज करें';
	@override String get enteroptiona => 'विकल्प A दर्ज करें';
	@override String get enteroptionb => 'विकल्प B दर्ज करें';
	@override String get enteroptionc => 'विकल्प C दर्ज करें';
	@override String get enteroptiond => 'विकल्प D दर्ज करें';
	@override String get choosea => 'उत्तर चुनें';
	@override String get optiona => 'विकल्प A';
	@override String get optionb => 'विकल्प B';
	@override String get optionc => 'विकल्प C';
	@override String get optiond => 'विकल्प D';
	@override String get selectqs => '   प्रश्नों का चयन करें   ';
	@override String get selectatleastoneq => 'कृपया कम से कम एक प्रश्न का चयन करें';
	@override String get noqs => 'प्रदर्शित करने के लिए कोई प्रश्न नहीं';
	@override String get makequizwarning => 'क्या आप वाकई चयनित प्रश्नों में से एक प्रश्नोत्तरी बनाना चाहते हैं?';
	@override String get selectdate => 'दिनांक का चयन करें:   ';
	@override String get qztime => 'कुल प्रश्नोत्तरी समय:   ';
	@override String get cancel => 'रद्द';
	@override String get qzcreated => 'प्रश्नोत्तरी सफलतापूर्वक बनाया गया है';
	@override String get noqzs => 'कोई प्रश्नोत्तरी नहीं !!';
	@override String get selectqz => 'किसी प्रश्नोत्तरी का चयन करें';
	@override String get listogqzs => 'सभी प्रश्नोत्तरी की सूची';
	@override String get noqzsmade => 'प्रश्नोत्तरी अभी तक नहीं बनाया गया है';
	@override String get gat => 'गट : ';
	@override String get date => 'दिनांक :  ';
	@override String get deleteqzs => 'क्विज़ हटाएँ';
	@override String get deleteqzwarning => 'क्या आप वाकई इस आबंटित प्रश्नोत्तरी को हटाना चाहते हैं ?';
	@override String get ok => 'ठीक है';
}

// Path: <root>
class _StringsKn implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsKn.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsKn _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageKn     homepage = _StringsHomepageKn._(_root);
	@override late final _StringsStudentmodeKn     studentmode = _StringsStudentmodeKn._(_root);
	@override late final _StringsManagestudentsKn     managestudents = _StringsManagestudentsKn._(_root);
	@override late final _StringsAllocatecontentKn     allocatecontent = _StringsAllocatecontentKn._(_root);
	@override late final _StringsTakeattendanceKn     takeattendance = _StringsTakeattendanceKn._(_root);
	@override late final _StringsReviewKn     review = _StringsReviewKn._(_root);
	@override late final _StringsAssessmentKn     assessment = _StringsAssessmentKn._(_root);
}

// Path:     homepage
class _StringsHomepageKn implements _StringsHomepageEn {
	_StringsHomepageKn._(this._root);

	@override final _StringsKn _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' ವಿದ್ಯಾರ್ಥಿ ಮೋಡ್';
	@override String get         takeattendance => ' ಹಾಜರಾತಿಯನ್ನು ತೆಗೆದುಕೊಳ್ಳಿ';
	@override String get         allocatecontent => ' ವಿಷಯವನ್ನು ಹಂಚಿಕೆ ಮಾಡಿ';
	@override String get         review => ' ವಿಮರ್ಶೆ';
	@override String get         managestudent => ' ವಿದ್ಯಾರ್ಥಿಯನ್ನು ನಿರ್ವಹಿಸಿ';
	@override String get         logout => ' ಲಾಗ್ ಔಟ್';
	@override String get         assessment => ' ಮೌಲ್ಯಮಾಪನ';
	@override String get         loadsampledata => ' ಡೇಟಾ ಲೋಡ್ ಮಾಡಿ';
	@override String get         ekal => ' ಏಕಲ್ ಆಚಾರ್ಯ';
	@override String get         synced => ' ಸರ್ವರ್ ಗೆ ಡೇಟಾವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕಳುಹಿಸಲಾಗಿದೆ';
	@override String get         notsynced => ' ಸಿಂಕ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ ದಯವಿಟ್ಟು ಇಂಟರ್ನೆಟ್ ಗೆ ಸಂಪರ್ಕಿಸಲು ಪ್ರಯತ್ನಿಸಿ ಮತ್ತು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';
	@override String get         loadeddata => ' ಲೋಡ್ ಮಾಡಿದ ಡೇಟಾ ಯಶಸ್ವಿಯಾಗಿ';
	@override String get         logoutwarning => ' ನೀವು ನಿಶ್ಚಯವಾಗಿ ನಿರ್ಗಮಿಸಲು ಬಯಸುವಿರಾ?';
	@override String get         yes => ' ಹೌದು';
	@override String get         no => ' ಇಲ್ಲ';
	@override String get         attention => ' ಗಮನ ಹರಿಸಿ!';
	@override String get         syncdata => ' ನೀವು ಯಶಸ್ವಿಯಾಗಿ ಸೇರಿಸಲ್ಪಟ್ಟಿದ್ದೀರಿ ಡೇಟಾ ಸಿಂಕ್ ಮಾಡಲು ಮರೆತಿಲ್ಲ ಡೇಟಾ';
}

// Path:     studentmode
class _StringsStudentmodeKn implements _StringsStudentmodeEn {
	_StringsStudentmodeKn._(this._root);

	@override final _StringsKn _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' ವಿದ್ಯಾರ್ಥಿ ಮೋಡ್';
	@override String get         selectdate => ' ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ';
	@override String get         nocontent => ' ಯಾವುದೇ ಹಂಚಿಕೆಯಾದ ವಿಷಯ ಸಿಗಲಿಲ್ಲ';
	@override String get         selectgat => ' ಮುಂದೆ ಸಾಗಲು ಒಂದು Gat ಅನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get         videoname => ' ವೀಡಿಯೊ ಹೆಸರು';
	@override String get         gat => ' ಗ್ಯಾಟ್';
	@override String get         subject => ' ವಿಷಯ';
	@override String get         topic => ' ವಿಷಯ';
	@override String get         watch => ' ವೀಡಿಯೊ ವೀಕ್ಷಿಸಿ';
	@override String get         nocontentforgat => ' ಆಯ್ಕೆಮಾಡಿದ ಘಾಟ್ ಗೆ ಯಾವುದೇ ಹಂಚಿಕೆಯಾದ ವಿಷಯ ಕಂಡುಬಂದಿಲ್ಲ ದಯವಿಟ್ಟು ಮೊದಲು ವಿಷಯವನ್ನು ಹಂಚಿಕೆ ಮಾಡಿ';
	@override String get         deletecontent => ' ಹಂಚಿಕೆಯಾದ ವಿಷಯವನ್ನು ಅಳಿಸು';
	@override String get         deletewarning => ' ಈ ಹಂಚಿಕೆಯಾದ ವಿಷಯವನ್ನು ನೀವು ಅಳಿಸಬೇಕೆಂದಿರುವುದು ಖಚಿತವೆ?';
	@override String get         no => ' ಇಲ್ಲ';
	@override String get         yes => ' ಹೌದು';
}

// Path:     managestudents
class _StringsManagestudentsKn implements _StringsManagestudentsEn {
	_StringsManagestudentsKn._(this._root);

	@override final _StringsKn _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => ' ವಿದ್ಯಾರ್ಥಿಗಳನ್ನು ನಿರ್ವಹಿಸಿ';
	@override String get         search => ' ಶೋಧಿಸು';
	@override String get         notfound => ' ಯಾವುದೇ ಫಲಿತಾಂಶಗಳು ಸಿಗಲಿಲ್ಲ';
	@override String get         addnew => ' ಹೊಸ ವಿದ್ಯಾರ್ಥಿಯನ್ನು ಸೇರಿಸಿ';
	@override String get         age => ' ವಯಸ್ಸು';
	@override String get         cancel => ' ರದ್ದುಮಾಡಿ';
	@override String get         submit => ' ಸಲ್ಲಿಸು';
	@override String get         name => ' ವಿದ್ಯಾರ್ಥಿಯ ಹೆಸರು';
	@override String get         editstudent => ' ವಿದ್ಯಾರ್ಥಿ ವಿವರಗಳನ್ನು ಸಂಪಾದನೆ ಮಾಡಿ';
	@override String get         deletestudent => ' ವಿದ್ಯಾರ್ಥಿ ವಿವರಗಳನ್ನು ಅಳಿಸಿ';
	@override String get         deletestudentwarning => ' ಈ ಮಗುವಿಗೆ ನೀವು ದಾಖಲೆಗಳನ್ನು ಅಳಿಸಲು ಬಯಸುವಿರಾ?';
	@override String get         delete => ' ಅಳಿಸು';
	@override String get         gat => ' ಗ್ಯಾಟ್';
	@override String get         studentadded => ' ವಿದ್ಯಾರ್ಥಿಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸೇರಿಸಲಾಗಿದೆ';
}

// Path:     allocatecontent
class _StringsAllocatecontentKn implements _StringsAllocatecontentEn {
	_StringsAllocatecontentKn._(this._root);

	@override final _StringsKn _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => ' ವಿಷಯವನ್ನು ಹಂಚಿಕೆ ಮಾಡಿ';
	@override String get         selectgat => ' ಗ್ಯಾಟ್ ಆಯ್ಕೆಮಾಡಿ';
	@override String get         selecttopic => ' ವಿಷಯ ಆಯ್ಕೆಮಾಡಿ';
	@override String get         selectvideos => ' ವೀಡಿಯೊಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get         selectedvideos => ' ಆಯ್ಕೆಯಾದ ವೀಡಿಯೊಗಳು';
	@override String get         dateofcontent => ' ವಿಷಯವನ್ನು ಹಂಚಿಕೆ ಮಾಡಲು ದಯವಿಟ್ಟು ದಿನಾಂಕವನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get         selectdate => ' ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ';
}

// Path:     takeattendance
class _StringsTakeattendanceKn implements _StringsTakeattendanceEn {
	_StringsTakeattendanceKn._(this._root);

	@override final _StringsKn _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => ' ಹಾಜರಾತಿಯನ್ನು ತೆಗೆದುಕೊಳ್ಳಿ';
	@override String get         date => ' ದಿನಾಂಕ';
	@override String get         dashboard => ' ಡ್ಯಾಶ್ ಬೋರ್ಡ್';
	@override String get         selectgat => ' ದಯವಿಟ್ಟು ಒಂದು Gat ಆಯ್ಕೆ ಮಾಡಿ';
	@override String get         selectdate => ' ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ';
	@override String get         save => ' ಉಳಿಸು';
	@override String get         attendancenottaken => ' ಹಾಜರಾತಿ ತೆಗೆದುಕೊಂಡಿಲ್ಲ';
	@override String get         nostudent => ' ಯಾವ ವಿದ್ಯಾರ್ಥಿಯೂ ಈ ಗ್ಯಾಟ್ ಗಾಗಿ ನೋಂದಾಯಿಸಿಲ್ಲ!';
	@override String get         holiday => ' ಇಂದು ರಜಾದಿನ';
	@override String get confirmattendance => 'ಹಾಜರಾತಿಯನ್ನು ದೃಢಪಡಿಸಿ';
	@override String get confirmwarning => 'ನೀವು ಈ ಹಾಜರಾತಿಯನ್ನು ಸಲ್ಲಿಸಲು ಬಯಸುತ್ತೀರೆಂದು ದಯವಿಟ್ಟು ದೃಢೀಕರಿಸಿ';
	@override String get cancel => 'ರದ್ದುಮಾಡಿ';
	@override String get ok => 'ಸರಿ';
	@override String get attendancetaken => 'ಹಾಜರಾತಿಯನ್ನು ಈಗಾಗಲೇ ತೆಗೆದುಕೊಳ್ಳಲಾಗಿದೆ';
	@override String get takenwarning => 'ನೀವು ಈಗಾಗಲೇ ಆ ಗಟ್ ಗಾಗಿ ಹಾಜರಾತಿಯನ್ನು ತೆಗೆದುಕೊಂಡಿದ್ದೀರಿ ಇಂದು';
}

// Path:     review
class _StringsReviewKn implements _StringsReviewEn {
	_StringsReviewKn._(this._root);

	@override final _StringsKn _root; // ignore: unused_field

	// Translations
	@override String get         review => ' ವಿಮರ್ಶೆ';
	@override String get         selectmonth => ' ತಿಂಗಳು ಆಯ್ಕೆಮಾಡಿ';
	@override String get         selectgat => ' ದಯವಿಟ್ಟು ಒಂದು Gat ಆಯ್ಕೆ ಮಾಡಿ';
	@override String get         attendancereview => ' ಹಾಜರಾತಿ ಪರಾಮರ್ಶೆ';
	@override String get         quizreview => ' ರಸಪ್ರಶ್ನೆ ವಿಮರ್ಶೆ';
	@override String get         videoprog => ' ವೀಡಿಯೊ ಪ್ರಗತಿ';
	@override String get         selectstudent => ' ದಯವಿಟ್ಟು ಒಬ್ಬ ವಿದ್ಯಾರ್ಥಿಯನ್ನು ಆಯ್ಕೆ ಮಾಡಿ';
	@override String get         nodata => ' ಆಯ್ಕೆಮಾಡಿದ ಫೀಲ್ಡ್ ಗಳಿಗೆ ತೋರಿಸಲು ಯಾವುದೇ ಡೇಟಾ ಇಲ್ಲ';
	@override String get         noquizgiven => ' ಯಾವುದೇ ರಸಪ್ರಶ್ನೆಗಳನ್ನು ನೀಡಲಾಗಿಲ್ಲ';
	@override String get         videono => ' ವೀಡಿಯೊ ಸಂಖ್ಯೆ.';
	@override String get         topic => ' ವಿಷಯ';
	@override String get         duration => ' ಅವಧಿ';
	@override String get         progress => ' ಪ್ರಗತಿ';
	@override String get         noattendance => ' ಹಾಜರಾತಿ ತೆಗೆದುಕೊಂಡಿಲ್ಲ';
}

// Path:     assessment
class _StringsAssessmentKn implements _StringsAssessmentEn {
	_StringsAssessmentKn._(this._root);

	@override final _StringsKn _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => ' ರಸಪ್ರಶ್ನೆಯನ್ನು ರಚಿಸಿ';
	@override String get         createqs => ' ಪ್ರಶ್ನೆಗಳನ್ನು ರಚಿಸಿ';
	@override String get         createqzs => ' ರಸಪ್ರಶ್ನೆಗಳನ್ನು ರಚಿಸಿ';
	@override String get         allqzs => ' ಎಲ್ಲಾ ರಸಪ್ರಶ್ನೆಗಳು';
	@override String get         giveqz => ' ರಸಪ್ರಶ್ನೆ ನೀಡಿ';
	@override String get         selectgat => ' ಗ್ಯಾಟ್ ಆಯ್ಕೆಮಾಡಿ';
	@override String get         selecttopic => ' ವಿಷಯ ಆಯ್ಕೆಮಾಡಿ';
	@override String get         enterq => ' ಪ್ರಶ್ನೆ ನಮೂದಿಸಿ';
	@override String get         enteroptiona => ' ಆಯ್ಕೆ A ನಮೂದಿಸಿ';
	@override String get         enteroptionb => ' ಆಯ್ಕೆ B ನಮೂದಿಸಿ';
	@override String get         enteroptionc => ' ಆಯ್ಕೆ C ನಮೂದಿಸಿ';
	@override String get         enteroptiond => ' ಆಯ್ಕೆ D ನಮೂದಿಸಿ';
	@override String get         choosea => ' ಉತ್ತರವನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get         optiona => ' ಆಯ್ಕೆ A';
	@override String get         optionb => ' ಆಯ್ಕೆ B';
	@override String get         optionc => ' ಆಯ್ಕೆ ಸಿ';
	@override String get         optiond => ' ಆಯ್ಕೆ ಡಿ';
	@override String get         selectqs => '     ಪ್ರಶ್ನೆಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get         selectatleastoneq => ' ದಯವಿಟ್ಟು ಕನಿಷ್ಠ ಒಂದು ಪ್ರಶ್ನೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get         noqs => ' ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಪ್ರಶ್ನೆಗಳಿಲ್ಲ';
	@override String get         makequizwarning => ' ಆಯ್ಕೆಮಾಡಿದ ಪ್ರಶ್ನೆಗಳಿಂದ ರಸಪ್ರಶ್ನೆಯನ್ನು ಮಾಡಲು ನೀವು ಖಚಿತವಾಗಿರುವಿರಾ?';
	@override String get         selectdate => ' ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ';
	@override String get         qztime => ' ಒಟ್ಟು ರಸಪ್ರಶ್ನೆ ಸಮಯ';
	@override String get         cancel => ' ರದ್ದುಮಾಡಿ';
	@override String get         qzcreated => ' ರಸಪ್ರಶ್ನೆಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ';
	@override String get         noqzs => ' !! ತೋರಿಸಲು ಯಾವುದೇ ರಸಪ್ರಶ್ನೆಗಳಿಲ್ಲ';
	@override String get         selectqz => ' ರಸಪ್ರಶ್ನೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';
	@override String get         listogqzs => ' ಎಲ್ಲಾ ರಸಪ್ರಶ್ನೆಗಳ ಪಟ್ಟಿ';
	@override String get         noqzsmade => ' ಇನ್ನೂ ಯಾವುದೇ ರಸಪ್ರಶ್ನೆಗಳನ್ನು ಮಾಡಲಾಗಿಲ್ಲ';
	@override String get         gat => ' ಗ್ಯಾಟ್ ';
	@override String get         date => 'ದಿನಾಂಕ ';
	@override String get         deleteqzs => ' ರಸಪ್ರಶ್ನೆಯನ್ನು ಅಳಿಸು';
	@override String get         deleteqzwarning => ' ಈ ಹಂಚಿಕೆ ಮಾಡಿದ ರಸಪ್ರಶ್ನೆಯನ್ನು ನೀವು ಅಳಿಸಬೇಕೆಂದಿರುವುದು ಖಚಿತವೆ?';
	@override String get ok => 'ಸರಿ';
}

// Path: <root>
class _StringsMa implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsMa.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsMa _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageMa     homepage = _StringsHomepageMa._(_root);
	@override late final _StringsStudentmodeMa     studentmode = _StringsStudentmodeMa._(_root);
	@override late final _StringsManagestudentsMa     managestudents = _StringsManagestudentsMa._(_root);
	@override late final _StringsAllocatecontentMa     allocatecontent = _StringsAllocatecontentMa._(_root);
	@override late final _StringsTakeattendanceMa     takeattendance = _StringsTakeattendanceMa._(_root);
	@override late final _StringsReviewMa     review = _StringsReviewMa._(_root);
	@override late final _StringsAssessmentMa     assessment = _StringsAssessmentMa._(_root);
}

// Path:     homepage
class _StringsHomepageMa implements _StringsHomepageEn {
	_StringsHomepageMa._(this._root);

	@override final _StringsMa _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => '    സ്റ്റുഡന്റ് മോഡ്';
	@override String get         takeattendance => ' ഹാജർ എടുക്കുക';
	@override String get         allocatecontent => ' ഉള്ളടക്കം അലോക്കേറ്റ് ചെയ്യുക';
	@override String get         review => ' അവലോകനം';
	@override String get         managestudent => ' വിദ്യാർത്ഥിയെ മാനേജുചെയ്യുക';
	@override String get         logout => ' ലോഗ്ഔട്ട്';
	@override String get         assessment => ' വിലയിരുത്തൽ';
	@override String get         loadsampledata => 'ഡാറ്റ നേടുക';
	@override String get         ekal => ' ഏകൽ ആചാര്യ';
	@override String get         synced => ' സെർവറിലേക്ക് ഡാറ്റ വിജയകരമായി അയച്ചു';
	@override String get         notsynced => ' സമന്വയിപ്പിക്കാൻ സാധ്യമല്ല, ഇന്റർനെറ്റിലേക്ക് കണക്റ്റുചെയ്യാൻ ശ്രമിക്കുക, വീണ്ടും ശ്രമിക്കുക';
	@override String get         loadeddata => ' ഡാറ്റ വിജയകരമായി ലോഡ് ചെയ്തു';
	@override String get         logoutwarning => ' നിങ്ങൾക്ക് ലോഗൗട്ട് ചെയ്യണമെന്ന് ഉറപ്പാണോ?';
	@override String get         yes => ' ശരി';
	@override String get         no => ' അല്ല';
	@override String get         attention => ' ശ്രദ്ധിക്കൂ!';
	@override String get         syncdata => ' നിങ്ങളെ വിജയകരമായി ചേർത്തു, ഡാറ്റ സമന്വയിപ്പിക്കാൻ മറക്കരുത്';
}

// Path:     studentmode
class _StringsStudentmodeMa implements _StringsStudentmodeEn {
	_StringsStudentmodeMa._(this._root);

	@override final _StringsMa _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => '     സ്റ്റുഡന്റ് മോഡ്';
	@override String get         selectdate => ' തീയതി തിരഞ്ഞെടുക്കുക';
	@override String get         nocontent => ' അലോക്കേറ്റ് ചെയ്ത ഉള്ളടക്കം ലഭ്യമല്ല';
	@override String get         selectgat => ' കൂടുതൽ മുന്നോട്ട് പോകുന്നതിന് ഒരു ഗാറ്റ് തിരഞ്ഞെടുക്കുക';
	@override String get         videoname => ' വീഡിയോയുടെ പേര്';
	@override String get         gat => ' ഗാറ്റ്';
	@override String get         subject => ' വിഷയം';
	@override String get         topic => ' വിഷയം';
	@override String get         watch => ' വീഡിയോ കാണുക';
	@override String get         nocontentforgat => ' തിരഞ്ഞെടുത്ത ഗാറ്റ്- നായി അലോക്കേറ്റ് ചെയ്ത ഉള്ളടക്കം ലഭ്യമല്ല ദയവായി ആദ്യം ഉള്ളടക്കം അലോക്കേറ്റ് ചെയ്യുക';
	@override String get         deletecontent => ' അലോക്കേറ്റ് ചെയ്ത ഉള്ളടക്കം ഇല്ലാതാക്കുക';
	@override String get         deletewarning => ' ഈ അലോക്കേറ്റ് ചെയ്ത ഉള്ളടക്കം ഇല്ലാതാക്കണമെന്ന് നിങ്ങൾക്ക് ഉറപ്പാണോ?';
	@override String get         no => ' അല്ല';
	@override String get         yes => ' ശരി';
}

// Path:     managestudents
class _StringsManagestudentsMa implements _StringsManagestudentsEn {
	_StringsManagestudentsMa._(this._root);

	@override final _StringsMa _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => '      വിദ്യാർത്ഥികളെ കൈകാര്യം ചെയ്യുക';
	@override String get         search => ' തിരയുക';
	@override String get         notfound => ' ഫലങ്ങളൊന്നും ലഭ്യമല്ല';
	@override String get         addnew => ' പുതിയ വിദ്യാർത്ഥിയെ ചേർക്കുക';
	@override String get         age => ' പ്രായം';
	@override String get         cancel => ' ക്യാൻസൽ ചെയ്യ്';
	@override String get         submit => ' സമർപ്പിക്കുക';
	@override String get         name => ' വിദ്യാർത്ഥിയുടെ പേര്';
	@override String get         editstudent => ' വിദ്യാർത്ഥികളുടെ വിശദാംശങ്ങൾ ചിട്ടപ്പെടുത്തുക';
	@override String get         deletestudent => ' വിദ്യാർത്ഥിയുടെ വിശദാംശങ്ങൾ ഇല്ലാതാക്കുക';
	@override String get         deletestudentwarning => ' ഈ കുട്ടിക്കായുള്ള രേഖകൾ ഇല്ലാതാക്കാൻ നിങ്ങൾ ആഗ്രഹിക്കുന്നുണ്ടോ?';
	@override String get         delete => ' നീക്കം ചെയ്യുക';
	@override String get         gat => ' ഗാറ്റ്';
	@override String get         studentadded => ' വിദ്യാർത്ഥിയെ വിജയകരമായി ചേർത്തു';
}

// Path:     allocatecontent
class _StringsAllocatecontentMa implements _StringsAllocatecontentEn {
	_StringsAllocatecontentMa._(this._root);

	@override final _StringsMa _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => '       ഉള്ളടക്കം അലോക്കേറ്റ് ചെയ്യുക';
	@override String get         selectgat => ' ഗാറ്റ് തിരഞ്ഞെടുക്കുക';
	@override String get         selecttopic => ' വിഷയം തെരഞ്ഞെടുക്കുക';
	@override String get         selectvideos => ' വീഡിയോകൾ തിരഞ്ഞെടുക്കുക';
	@override String get         selectedvideos => ' തിരഞ്ഞെടുത്ത\nവീഡിയോകൾ';
	@override String get         dateofcontent => ' ഉള്ളടക്കം അലോക്കേറ്റ് ചെയ്യുന്നതിനുള്ള തീയതി തിരഞ്ഞെടുക്കുക';
	@override String get         selectdate => ' തീയതി തിരഞ്ഞെടുക്കുക';
}

// Path:     takeattendance
class _StringsTakeattendanceMa implements _StringsTakeattendanceEn {
	_StringsTakeattendanceMa._(this._root);

	@override final _StringsMa _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => ' ഹാജർ എടുക്കുക';
	@override String get         date => ' ഈന്തപ്പന';
	@override String get         dashboard => ' ഡാഷ് ബോർഡ്';
	@override String get         selectgat => ' ദയവായി ഒരു ഗാട്ട് തിരഞ്ഞെടുക്കുക';
	@override String get         selectdate => ' തീയതി\nതിരഞ്ഞെടുക്കുക';
	@override String get         save => ' സൂക്ഷിക്കുക';
	@override String get         attendancenottaken => ' ഹാജർ എടുത്തിട്ടില്ല';
	@override String get         nostudent => ' ഈ ഗാറ്റിനായി ഒരു വിദ്യാർത്ഥിയും രജിസ്റ്റർ ചെയ്തിട്ടില്ല!';
	@override String get         holiday => ' ഇന്ന് അവധിയാണ്';
	@override String get confirmattendance => 'ഹാജർ സ്ഥിരീകരിക്കുക';
	@override String get confirmwarning => 'ഈ ഹാജർ സമർപ്പിക്കാൻ നിങ്ങൾ ആഗ്രഹിക്കുന്നുവെന്ന് ദയവായി സ്ഥിരീകരിക്കുക';
	@override String get cancel => 'ക്യാൻസൽ ചെയ്യ്';
	@override String get ok => 'ശരി';
	@override String get attendancetaken => 'ഹാജർ ഇതിനകം എടുത്തിട്ടുണ്ട്';
	@override String get takenwarning => 'നിങ്ങൾ ഇന്ന് ആ ഗാട്ടിനായി ഹാജർ എടുത്തുകഴിഞ്ഞു';
}

// Path:     review
class _StringsReviewMa implements _StringsReviewEn {
	_StringsReviewMa._(this._root);

	@override final _StringsMa _root; // ignore: unused_field

	// Translations
	@override String get         review => '        അവലോകനം';
	@override String get         selectmonth => ' മാസം തിരഞ്ഞെടുക്കുക';
	@override String get         selectgat => ' ദയവായി ഒരു ഗാട്ട് തിരഞ്ഞെടുക്കുക';
	@override String get         attendancereview => ' ഹാജർ അവലോകനം';
	@override String get         quizreview => ' ക്വിസ് അവലോകനം';
	@override String get         videoprog => ' വീഡിയോ പുരോഗതി';
	@override String get         selectstudent => ' ദയവായി ഒരു വിദ്യാർത്ഥിയെ തിരഞ്ഞെടുക്കുക';
	@override String get         nodata => ' തിരഞ്ഞെടുത്ത ഫീൽഡുകൾക്കായി കാണിക്കേണ്ട ഡാറ്റയില്ല';
	@override String get         noquizgiven => ' ക്വിസ്സുകൾ നൽകിയിട്ടില്ല';
	@override String get         videono => ' വീഡിയോ നമ്പർ.';
	@override String get         topic => ' വിഷയം';
	@override String get         duration => ' ദൈർഘ്യം';
	@override String get         progress => ' പുരോഗതി';
	@override String get         noattendance => ' അറ്റൻഡൻസ് എടുത്തിട്ടില്ല';
}

// Path:     assessment
class _StringsAssessmentMa implements _StringsAssessmentEn {
	_StringsAssessmentMa._(this._root);

	@override final _StringsMa _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => '  ക്വിസ് സൃഷ്ടിക്കുക';
	@override String get         createqs => ' ചോദ്യങ്ങൾ സൃഷ്ടിക്കുക';
	@override String get         createqzs => ' ക്വിസുകൾ സൃഷ്ടിക്കുക';
	@override String get         allqzs => ' എല്ലാ ക്വിസ്സുകളും';
	@override String get         giveqz => ' ക്വിസ് നൽകുക';
	@override String get         selectgat => ' ഗാറ്റ് തിരഞ്ഞെടുക്കുക';
	@override String get         selecttopic => ' വിഷയം\nതെരഞ്ഞെടുക്കുക';
	@override String get         enterq => ' ചോദ്യം നൽകുക';
	@override String get         enteroptiona => ' ഐച്ഛികം A നൽകുക';
	@override String get         enteroptionb => ' ഓപ്ഷൻ ബി നൽകുക';
	@override String get         enteroptionc => ' ഓപ്ഷൻ C നൽകുക';
	@override String get         enteroptiond => ' ഓപ്ഷൻ D നൽകുക';
	@override String get         choosea => ' ഉത്തരം\nതിരഞ്ഞെടുക്കുക';
	@override String get         optiona => ' ഐച്ഛികം എ';
	@override String get         optionb => ' ഓപ്ഷൻ ബി';
	@override String get         optionc => ' ഐച്ഛികം C';
	@override String get         optiond => ' ഐച്ഛികം D ';
	@override String get         selectqs => '    ചോദ്യങ്ങൾ തിരഞ്ഞെടുക്കുക   ';
	@override String get         selectatleastoneq => ' കുറഞ്ഞത് ഒരു ചോദ്യമെങ്കിലും തിരഞ്ഞെടുക്കുക';
	@override String get         noqs => ' പ്രദർശിപ്പിക്കാൻ ചോദ്യങ്ങളില്ല';
	@override String get         makequizwarning => ' തിരഞ്ഞെടുത്ത ചോദ്യങ്ങളിൽ നിന്ന് ഒരു ക്വിസ് നടത്താൻ നിങ്ങൾ ആഗ്രഹിക്കുന്നുവെന്ന് നിങ്ങൾക്ക് ഉറപ്പാണോ?';
	@override String get         selectdate => ' തീയതി തിരഞ്ഞെടുക്കുക';
	@override String get         qztime => ' മൊത്തം ക്വിസ് സമയം';
	@override String get         cancel => ' ക്യാൻസൽ ചെയ്യ്';
	@override String get         qzcreated => ' ക്വിസ് വിജയകരമായി സൃഷ്ടിച്ചു';
	@override String get         noqzs => ' കാണിക്കാൻ ക്വിസുകളില്ല!!';
	@override String get         selectqz => ' ഒരു ക്വിസ് തിരഞ്ഞെടുക്കുക';
	@override String get         listogqzs => ' എല്ലാ ക്വിസ്സുകളുടെയും ലിസ്റ്റ്';
	@override String get         noqzsmade => ' ക്വിസുകള് ഇതുവരെ നടത്തിയിട്ടില്ല';
	@override String get         gat => ' ഗാറ്റ് ';
	@override String get         date => 'ഈന്തപ്പന ';
	@override String get         deleteqzs => ' ഒരു ക്വിസ് ഇല്ലാതാക്കുക';
	@override String get         deleteqzwarning => ' ഈ അലോക്കേറ്റഡ് ക്വിസ് ഇല്ലാതാക്കണമെന്ന് നിങ്ങൾക്ക് ഉറപ്പാണോ?';
	@override String get ok => 'ശരി';
}

// Path: <root>
class _StringsMr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsMr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsMr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageMr     homepage = _StringsHomepageMr._(_root);
	@override late final _StringsStudentmodeMr     studentmode = _StringsStudentmodeMr._(_root);
	@override late final _StringsManagestudentsMr     managestudents = _StringsManagestudentsMr._(_root);
	@override late final _StringsAllocatecontentMr     allocatecontent = _StringsAllocatecontentMr._(_root);
	@override late final _StringsTakeattendanceMr     takeattendance = _StringsTakeattendanceMr._(_root);
	@override late final _StringsReviewMr     review = _StringsReviewMr._(_root);
	@override late final _StringsAssessmentMr     assessment = _StringsAssessmentMr._(_root);
}

// Path:     homepage
class _StringsHomepageMr implements _StringsHomepageEn {
	_StringsHomepageMr._(this._root);

	@override final _StringsMr _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => '  विद्यार्थी मोड';
	@override String get         takeattendance => ' उपस्थिती घ्या';
	@override String get         allocatecontent => ' सामग्रीचे वाटप करा';
	@override String get         review => ' परीक्षण';
	@override String get         managestudent => ' विद्यार्थी व्यवस्थापित करा';
	@override String get         logout => ' लॉग आउट करा';
	@override String get         assessment => ' मूल्यांकन';
	@override String get         loadsampledata => ' डेटा लोड करा';
	@override String get         ekal => ' एकल आचार्य';
	@override String get         synced => ' सर्व्हरवर यशस्वीरित्या पाठविलेला डेटा';
	@override String get         notsynced => ' समक्रमित करणे शक्य नाही कृपया इंटरनेटशी कनेक्ट होण्याचा प्रयत्न करा आणि पुन्हा प्रयत्न करा';
	@override String get         loadeddata => ' दाखल केलेला डेटा यशस्वीरित्या दाखल केला';
	@override String get         logoutwarning => ' आपल्याला खात्री आहे की आपण लॉगआउट करू इच्छिता?';
	@override String get         yes => ' हो';
	@override String get         no => ' नाही';
	@override String get         attention => ' ध्यान!';
	@override String get         syncdata => ' आप सफल रूप से जोड़ा गया है डेटा समक्रमित करने से भुलना नहीं';
}

// Path:     studentmode
class _StringsStudentmodeMr implements _StringsStudentmodeEn {
	_StringsStudentmodeMr._(this._root);

	@override final _StringsMr _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' विद्यार्थी मोड';
	@override String get         selectdate => ' निवडा तारीख';
	@override String get         nocontent => ' वाटप केलेली सामग्री आढळली नाही';
	@override String get         selectgat => ' पुढे जाण्यासाठी गॅट निवडा';
	@override String get         videoname => ' व्हिडिओचे नाव';
	@override String get         gat => ' Gat';
	@override String get         subject => ' विषय';
	@override String get         topic => ' विषय';
	@override String get         watch => ' पाहा व्हिडिओ';
	@override String get         nocontentforgat => ' निवडलेल्या गॅट करीता वाटप केलेली सामग्री आढळली नाही कृपया प्रथम सामग्रीचे वाटप करा';
	@override String get         deletecontent => ' वाटप केलेली सामग्री नष्ट करा';
	@override String get         deletewarning => ' आपल्याला खात्री आहे की आपण ही वाटप केलेली सामग्री हटवू इच्छिता?';
	@override String get         no => ' नाही';
	@override String get         yes => ' हो';
}

// Path:     managestudents
class _StringsManagestudentsMr implements _StringsManagestudentsEn {
	_StringsManagestudentsMr._(this._root);

	@override final _StringsMr _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => '  विद्यार्थ्यांचे व्यवस्थापन करा';
	@override String get         search => ' शोधणे';
	@override String get         notfound => ' परिणाम आढळले नाहीत';
	@override String get         addnew => ' नवीन विद्यार्थी जोडा';
	@override String get         age => ' युग';
	@override String get         cancel => ' रद्द करा';
	@override String get         submit => ' प्रस्तुत करा';
	@override String get         name => ' विद्यार्थ्याचे नाव';
	@override String get         editstudent => ' विद्यार्थी तपशीलसंपादन करा';
	@override String get         deletestudent => ' विद्यार्थ्यांचे तपशील नष्ट करा';
	@override String get         deletestudentwarning => ' तुम्हाला या मुलासाठीचे रेकॉर्ड डिलीट करायचे आहेत का?';
	@override String get         delete => ' हटवा';
	@override String get         gat => ' Gat';
	@override String get         studentadded => ' विद्यार्थी यशस्वीरित्या जोडला गेला आहे';
}

// Path:     allocatecontent
class _StringsAllocatecontentMr implements _StringsAllocatecontentEn {
	_StringsAllocatecontentMr._(this._root);

	@override final _StringsMr _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => ' सामग्रीचे वाटप करा';
	@override String get         selectgat => ' गाट निवडा';
	@override String get         selecttopic => ' विषय निवडा';
	@override String get         selectvideos => ' व्हिडिओ निवडा';
	@override String get         selectedvideos => ' निवडलेले व्हिडिओ';
	@override String get         dateofcontent => ' कृपया सामग्रीचे वाटप करण्याकरीता तारीख निवडा';
	@override String get         selectdate => ' निवडा तारीख';
}

// Path:     takeattendance
class _StringsTakeattendanceMr implements _StringsTakeattendanceEn {
	_StringsTakeattendanceMr._(this._root);

	@override final _StringsMr _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => '  उपस्थिती घ्या';
	@override String get         date => ' तारीख';
	@override String get         dashboard => ' डॅशबोर्डName';
	@override String get         selectgat => ' कृपया गॅट निवडा';
	@override String get         selectdate => ' निवडा तारीख';
	@override String get         save => ' बचत करणे';
	@override String get         attendancenottaken => ' उपस्थिती घेतली नाही';
	@override String get         nostudent => ' कोणताही विद्यार्थी या गॅटसाठी नोंदणी करत नाही!';
	@override String get         holiday => ' आज सुट्टी आहे';
	@override String get confirmattendance => 'उपस्थितीची पुष्टी करा';
	@override String get confirmwarning => 'कृपया पुष्टी करा की आपण ही उपस्थिती सबमिट करू इच्छिता';
	@override String get cancel => 'रद्द करा';
	@override String get ok => 'ठीक आहे';
	@override String get attendancetaken => 'आधीच घेतलेली उपस्थिती';
	@override String get takenwarning => 'तू आजच त्या गॅटची उपस्थिती घेतली आहेस.';
}

// Path:     review
class _StringsReviewMr implements _StringsReviewEn {
	_StringsReviewMr._(this._root);

	@override final _StringsMr _root; // ignore: unused_field

	// Translations
	@override String get         review => '   परीक्षण';
	@override String get         selectmonth => ' महिना निवडा';
	@override String get         selectgat => ' कृपया गॅट निवडा';
	@override String get         attendancereview => ' उपस्थिती पुनरावलोकन';
	@override String get         quizreview => ' क्विज रिव्यू';
	@override String get         videoprog => ' व्हिडिओ प्रगती';
	@override String get         selectstudent => ' कृपया विद्यार्थी निवडा';
	@override String get         nodata => ' निवडलेल्या क्षेत्र करीता दर्शविण्याकरीता माहिती नाही';
	@override String get         noquizgiven => ' क्विझेस दिले नाहीत';
	@override String get         videono => ' व्हिडिओ क्र.';
	@override String get         topic => ' विषय';
	@override String get         duration => ' कालावधी';
	@override String get         progress => ' प्रगती';
	@override String get         noattendance => ' उपस्थिती घेतली नाही';
}

// Path:     assessment
class _StringsAssessmentMr implements _StringsAssessmentEn {
	_StringsAssessmentMr._(this._root);

	@override final _StringsMr _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => ' क्विझ बनवा';
	@override String get         createqs => ' प्रश्न निर्माण करा';
	@override String get         createqzs => ' क्विझेस बनवा';
	@override String get         allqzs => ' सर्व क्विझेस';
	@override String get         giveqz => ' क्विझ द्या';
	@override String get         selectgat => ' गाट निवडा';
	@override String get         selecttopic => ' विषय निवडा';
	@override String get         enterq => ' प्रश्न प्रविष्ट करा';
	@override String get         enteroptiona => ' पर्याय A प्रविष्ट करा';
	@override String get         enteroptionb => ' पर्याय B प्रविष्ट करा';
	@override String get         enteroptionc => ' पर्याय C प्रविष्ट करा';
	@override String get         enteroptiond => ' पर्याय D प्रविष्ट करा';
	@override String get         choosea => ' उत्तर निवडा';
	@override String get         optiona => ' पर्याय A';
	@override String get         optionb => ' पर्याय B';
	@override String get         optionc => ' पर्याय C';
	@override String get         optiond => ' पर्याय D ';
	@override String get         selectqs => '    प्रश्न निवडा   ';
	@override String get         selectatleastoneq => ' कृपया किमान एक प्रश्न निवडा';
	@override String get         noqs => ' प्रदर्शन करण्याकरीता प्रश्न नाही';
	@override String get         makequizwarning => ' आपल्याला खात्री आहे की आपण निवडलेल्या प्रश्नांमधून क्विझ बनवू इच्छिता?';
	@override String get         selectdate => ' निवडा तारीख';
	@override String get         qztime => ' एकूण क्विझ वेळ';
	@override String get         cancel => ' रद्द करा';
	@override String get         qzcreated => ' क्विझ यशस्वीरित्या तयार केले गेले आहे';
	@override String get         noqzs => ' दाखवण्यासाठी क्विझेस नाहीत!!';
	@override String get         selectqz => ' क्विझ निवडा';
	@override String get         listogqzs => ' सर्व क्विझची यादी';
	@override String get         noqzsmade => ' अद्याप कोणतीही क्विझेस तयार केलेली नाहीत';
	@override String get         gat => ' Gat ';
	@override String get         date => 'तारीख ';
	@override String get         deleteqzs => ' क्विझ हटवा';
	@override String get         deleteqzwarning => ' आपल्याला खात्री आहे की आपण हे वाटप केलेले क्विझ हटवू इच्छिता?';
	@override String get ok => 'ठीक आहे';
}

// Path: <root>
class _StringsOd implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsOd.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsOd _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageOd     homepage = _StringsHomepageOd._(_root);
	@override late final _StringsStudentmodeOd     studentmode = _StringsStudentmodeOd._(_root);
	@override late final _StringsManagestudentsOd     managestudents = _StringsManagestudentsOd._(_root);
	@override late final _StringsAllocatecontentOd     allocatecontent = _StringsAllocatecontentOd._(_root);
	@override late final _StringsTakeattendanceOd     takeattendance = _StringsTakeattendanceOd._(_root);
	@override late final _StringsReviewOd     review = _StringsReviewOd._(_root);
	@override late final _StringsAssessmentOd     assessment = _StringsAssessmentOd._(_root);
}

// Path:     homepage
class _StringsHomepageOd implements _StringsHomepageEn {
	_StringsHomepageOd._(this._root);

	@override final _StringsOd _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' ଛାତ୍ର ମୋଡ୍';
	@override String get         takeattendance => ' ଉପସ୍ଥାନ ନିଅନ୍ତୁ';
	@override String get         allocatecontent => ' ବିଷୟବସ୍ତୁ ଆବଣ୍ଟନ';
	@override String get         review => ' ସମୀକ୍ଷା';
	@override String get         managestudent => ' ଛାତ୍ର ପରିଚାଳନା କରନ୍ତୁ';
	@override String get         logout => ' ଲଗ୍ ଆଉଟ୍ କରନ୍ତୁ';
	@override String get         assessment => ' ମୂଲ୍ୟାଙ୍କନ';
	@override String get         loadsampledata => ' ଡାଟା ଲୋଡ୍ କରନ୍ତୁ';
	@override String get         ekal => ' ଏକାଲ ଆଚାର୍ଯ୍ୟ';
	@override String get         synced => ' ସର୍ଭରକୁ ସଫଳତାର ସହ ଡାଟା ପ୍ରେରଣ ହୋଇଛି';
	@override String get         notsynced => ' ସିଙ୍କ୍ ସମ୍ଭବ ନୁହେଁ ଦୟାକରି ଇଣ୍ଟର୍ନେଟ୍ ସଂଯୋଗ କରିବାକୁ ଚେଷ୍ଟା କରନ୍ତୁ ଏବଂ ପୁନଃଚେଷ୍ଟା କରନ୍ତୁ';
	@override String get         loadeddata => ' ଲୋଡ୍ ହୋଇଥିବା ଡାଟା ସଫଳତାର ସହ';
	@override String get         logoutwarning => ' ଆପଣ ଲଗ୍ ଆଉଟ୍ କରିବାକୁ ଚାହୁଁଛନ୍ତି କି?';
	@override String get         yes => ' ହଁ';
	@override String get         no => ' ନାହିଁ';
	@override String get         attention => ' ଧ୍ୟାନ!';
	@override String get         syncdata => ' ଆପଣ ସଫଳତାର ସହ ଯୋଡି ହୋଇଯାଇଛନ୍ତି ଡାଟା ସିଙ୍କ୍ କରିବାକୁ ଭୁଲିନାହିଁ';
}

// Path:     studentmode
class _StringsStudentmodeOd implements _StringsStudentmodeEn {
	_StringsStudentmodeOd._(this._root);

	@override final _StringsOd _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' ଛାତ୍ର ମୋଡ୍';
	@override String get         selectdate => ' ତାରିଖ ଚୟନ କରନ୍ତୁ';
	@override String get         nocontent => ' କୌଣସି ଆବଣ୍ଟିତ ବିଷୟବସ୍ତୁ ମିଳିଲା ନାହିଁ';
	@override String get         selectgat => ' ଆଗକୁ ବଢିବା ପାଇଁ ଏକ ଗାଟ୍ ଚୟନ କରନ୍ତୁ';
	@override String get         videoname => ' ଭିଡିଓ ନାମ';
	@override String get         gat => ' ଗାଟ';
	@override String get         subject => ' ବିଷୟ';
	@override String get         topic => ' ବିଷୟ';
	@override String get         watch => ' ଭିଡିଓ ଦେଖନ୍ତୁ';
	@override String get         nocontentforgat => ' ଚୟନିତ ଗାଟ୍ ପାଇଁ କୌଣସି ଆବଣ୍ଟିତ ବିଷୟବସ୍ତୁ ମିଳିଲା ନାହିଁ ଦୟାକରି ପ୍ରଥମେ ବିଷୟବସ୍ତୁ ଆବଣ୍ଟନ କରନ୍ତୁ';
	@override String get         deletecontent => ' ଏକ ଆବଣ୍ଟିତ ବିଷୟବସ୍ତୁ ବିଲୋପ କରନ୍ତୁ';
	@override String get         deletewarning => ' ଆପଣ ନିଶ୍ଚିତ କି ଆପଣ ଏହି ଆବଣ୍ଟିତ ବିଷୟବସ୍ତୁ ବିଲୋପ କରିବାକୁ ଚାହାଁନ୍ତି?';
	@override String get         no => ' ନାହିଁ';
	@override String get         yes => ' ହଁ';
}

// Path:     managestudents
class _StringsManagestudentsOd implements _StringsManagestudentsEn {
	_StringsManagestudentsOd._(this._root);

	@override final _StringsOd _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => '  ଛାତ୍ରମାନଙ୍କୁ ପରିଚାଳନା କରନ୍ତୁ';
	@override String get         search => ' ସନ୍ଧାନ କରନ୍ତୁ';
	@override String get         notfound => ' କୌଣସି ଫଳାଫଳ ମିଳିଲା ନାହିଁ';
	@override String get         addnew => ' ନୂତନ ଛାତ୍ର ଯୋଡନ୍ତୁ';
	@override String get         age => ' ବୟସ';
	@override String get         cancel => ' ବାତିଲ୍‌ କରନ୍ତୁ';
	@override String get         submit => ' ଜମା କରନ୍ତୁ';
	@override String get         name => ' ଛାତ୍ରଙ୍କ ନାମ';
	@override String get         editstudent => ' ଛାତ୍ର ବିବରଣୀ ସମ୍ପାଦନ କରନ୍ତୁ';
	@override String get         deletestudent => ' ଛାତ୍ର ବିବରଣୀ ବିଲୋପ କରନ୍ତୁ';
	@override String get         deletestudentwarning => ' ଆପଣ ଏହି ଶିଶୁ ପାଇଁ ରେକର୍ଡଗୁଡିକ ବିଲୋପ କରିବାକୁ ଚାହାଁନ୍ତି କି?';
	@override String get         delete => ' ବିଲୋପ କରନ୍ତୁ';
	@override String get         gat => ' ଗାଟ';
	@override String get         studentadded => ' ଛାତ୍ରଙ୍କୁ ସଫଳତାର ସହ ଯୋଡାଯାଇଛି';
}

// Path:     allocatecontent
class _StringsAllocatecontentOd implements _StringsAllocatecontentEn {
	_StringsAllocatecontentOd._(this._root);

	@override final _StringsOd _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => ' ବିଷୟବସ୍ତୁ ଆବଣ୍ଟନ';
	@override String get         selectgat => ' ଗାଟ୍ ଚୟନ କରନ୍ତୁ';
	@override String get         selecttopic => ' ବିଷୟ ଚୟନ କରନ୍ତୁ';
	@override String get         selectvideos => ' ଭିଡିଓ ଗୁଡିକ ଚୟନ କରନ୍ତୁ';
	@override String get         selectedvideos => ' ଚୟନିତ ଭିଡିଓଗୁଡିକ';
	@override String get         dateofcontent => ' ଦୟାକରି ବିଷୟବସ୍ତୁ ଆବଣ୍ଟନ କରିବାକୁ ଏକ ତାରିଖ ଚୟନ କରନ୍ତୁ';
	@override String get         selectdate => ' ତାରିଖ ଚୟନ କରନ୍ତୁ';
}

// Path:     takeattendance
class _StringsTakeattendanceOd implements _StringsTakeattendanceEn {
	_StringsTakeattendanceOd._(this._root);

	@override final _StringsOd _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => ' ଉପସ୍ଥାନ ନିଅନ୍ତୁ';
	@override String get         date => ' ତାରିଖ';
	@override String get         dashboard => ' ଡାଶବୋର୍ଡ';
	@override String get         selectgat => ' ଦୟାକରି ଏକ ଗାଟ୍ ଚୟନ କରନ୍ତୁ';
	@override String get         selectdate => ' ତାରିଖ ଚୟନ କରନ୍ତୁ';
	@override String get         save => ' ସଞ୍ଚୟ କରନ୍ତୁ';
	@override String get         attendancenottaken => ' ଉପସ୍ଥିତି ନିଆଯାଇ ନାହିଁ';
	@override String get         nostudent => ' ଏହି ଗାଟ୍ ପାଇଁ କୌଣସି ଛାତ୍ର ପଞ୍ଜିକରଣ କରୁନାହାଁନ୍ତି!';
	@override String get         holiday => ' ଆଜି ଛୁଟିଦିନ';
	@override String get confirmattendance => 'ଉପସ୍ଥାନ ନିଶ୍ଚିତ କରନ୍ତୁ';
	@override String get confirmwarning => 'ଦୟାକରି ନିଶ୍ଚିତ କରନ୍ତୁ ଯେ ଆପଣ ଏହି ଉପସ୍ଥାନ ଦାଖଲ କରିବାକୁ ଚାହାଁନ୍ତି';
	@override String get cancel => 'ବାତିଲ୍‌ କରନ୍ତୁ';
	@override String get ok => 'ଠିକ୍‌ ଅଛି';
	@override String get attendancetaken => 'ଉପସ୍ଥାନ ପୂର୍ବରୁ ନିଆଯାଇଛି';
	@override String get takenwarning => 'ଆପଣ ଆଜି ସେହି ଗାଟ୍ ପାଇଁ ଉପସ୍ଥାନ ନେଇସାରିଛନ୍ତି';
}

// Path:     review
class _StringsReviewOd implements _StringsReviewEn {
	_StringsReviewOd._(this._root);

	@override final _StringsOd _root; // ignore: unused_field

	// Translations
	@override String get         review => '  ସମୀକ୍ଷା';
	@override String get         selectmonth => ' ମାସ ଚୟନ କରନ୍ତୁ';
	@override String get         selectgat => ' ଦୟାକରି ଏକ ଗାଟ୍ ଚୟନ କରନ୍ତୁ';
	@override String get         attendancereview => ' ଉପସ୍ଥାନ ସମୀକ୍ଷା';
	@override String get         quizreview => ' କୁଇଜ୍ ସମୀକ୍ଷା';
	@override String get         videoprog => ' ଭିଡିଓ ପ୍ରଗତି';
	@override String get         selectstudent => ' ଦୟାକରି ଜଣେ ଛାତ୍ର ଚୟନ କରନ୍ତୁ';
	@override String get         nodata => ' ଚୟନିତ କ୍ଷେତ୍ରଗୁଡିକ ପାଇଁ ଦେଖାଇବାକୁ କୌଣସି ଡାଟା ନାହିଁ';
	@override String get         noquizgiven => ' କୌଣସି କୁଇଜ୍ ଦିଆଯାଇନାହିଁ';
	@override String get         videono => ' ଭିଡିଓ ନଂ.';
	@override String get         topic => ' ବିଷୟ';
	@override String get         duration => ' ଅବଧି';
	@override String get         progress => ' ପ୍ରଗତି';
	@override String get         noattendance => ' ଉପସ୍ଥିତି ନିଆଯାଇ ନାହିଁ';
}

// Path:     assessment
class _StringsAssessmentOd implements _StringsAssessmentEn {
	_StringsAssessmentOd._(this._root);

	@override final _StringsOd _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => '  କୁଇଜ୍ ସୃଷ୍ଟି କରନ୍ତୁ';
	@override String get         createqs => ' ପ୍ରଶ୍ନସୃଷ୍ଟି କରନ୍ତୁ';
	@override String get         createqzs => ' କୁଇଜ୍ ସୃଷ୍ଟି କରନ୍ତୁ';
	@override String get         allqzs => ' ସମସ୍ତ କୁଇଜ୍';
	@override String get         giveqz => ' କୁଇଜ୍ ଦିଅନ୍ତୁ';
	@override String get         selectgat => ' ଗାଟ୍ ଚୟନ କରନ୍ତୁ';
	@override String get         selecttopic => ' ବିଷୟ ଚୟନ କରନ୍ତୁ';
	@override String get         enterq => ' ପ୍ରଶ୍ନ ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get         enteroptiona => ' ବିକଳ୍ପ ଏ ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get         enteroptionb => ' ବିକଳ୍ପ ବି ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get         enteroptionc => ' ବିକଳ୍ପ ସି ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get         enteroptiond => ' ବିକଳ୍ପ ଡି ପ୍ରବେଶ କରନ୍ତୁ';
	@override String get         choosea => ' ଉତ୍ତର ବାଛନ୍ତୁ';
	@override String get         optiona => ' ବିକଳ୍ପ ଏ';
	@override String get         optionb => ' ବିକଳ୍ପ ବି';
	@override String get         optionc => ' ବିକଳ୍ପ ସି';
	@override String get         optiond => ' ବିକଳ୍ପ ଡି ';
	@override String get         selectqs => '    ପ୍ରଶ୍ନଗୁଡିକ ଚୟନ କରନ୍ତୁ   ';
	@override String get         selectatleastoneq => ' ଦୟାକରି ଅତିକମରେ ଗୋଟିଏ ପ୍ରଶ୍ନ ଚୟନ କରନ୍ତୁ';
	@override String get         noqs => ' ପ୍ରଦର୍ଶନ କରିବାକୁ କୌଣସି ପ୍ରଶ୍ନ ନାହିଁ';
	@override String get         makequizwarning => ' ଆପଣ ନିଶ୍ଚିତ କି ଆପଣ ଚୟନିତ ପ୍ରଶ୍ନଗୁଡିକରୁ ଏକ କୁଇଜ୍ କରିବାକୁ ଚାହାଁନ୍ତି?';
	@override String get         selectdate => ' ତାରିଖ ଚୟନ କରନ୍ତୁ';
	@override String get         qztime => ' ମୋଟ କୁଇଜ୍ ସମୟ';
	@override String get         cancel => ' ବାତିଲ୍‌ କରନ୍ତୁ';
	@override String get         qzcreated => ' କୁଇଜ୍ ସଫଳତାର ସହ ସୃଷ୍ଟି ହୋଇଛି';
	@override String get         noqzs => ' ଦେଖାଇବାକୁ କୌଣସି କୁଇଜ୍ ନାହିଁ !!';
	@override String get         selectqz => ' ଏକ କୁଇଜ୍ ଚୟନ କରନ୍ତୁ';
	@override String get         listogqzs => ' ସମସ୍ତ କୁଇଜ୍ ର ତାଲିକା';
	@override String get         noqzsmade => ' ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି କୁଇଜ୍ ତିଆରି ହୋଇନାହିଁ';
	@override String get         gat => ' ଗାଟ ';
	@override String get         date => 'ତାରିଖ ';
	@override String get         deleteqzs => ' ଏକ କୁଇଜ୍ ବିଲୋପ କରନ୍ତୁ';
	@override String get         deleteqzwarning => ' ଆପଣ ନିଶ୍ଚିତ କି ଆପଣ ଏହି ଆବଣ୍ଟିତ କୁଇଜ୍ ବିଲୋପ କରିବାକୁ ଚାହାଁନ୍ତି?';
	@override String get ok => 'ଠିକ୍‌ ଅଛି';
}

// Path: <root>
class _StringsPn implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPn.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsPn _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepagePn     homepage = _StringsHomepagePn._(_root);
	@override late final _StringsStudentmodePn     studentmode = _StringsStudentmodePn._(_root);
	@override late final _StringsManagestudentsPn     managestudents = _StringsManagestudentsPn._(_root);
	@override late final _StringsAllocatecontentPn     allocatecontent = _StringsAllocatecontentPn._(_root);
	@override late final _StringsTakeattendancePn     takeattendance = _StringsTakeattendancePn._(_root);
	@override late final _StringsReviewPn     review = _StringsReviewPn._(_root);
	@override late final _StringsAssessmentPn     assessment = _StringsAssessmentPn._(_root);
}

// Path:     homepage
class _StringsHomepagePn implements _StringsHomepageEn {
	_StringsHomepagePn._(this._root);

	@override final _StringsPn _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' ਵਿਦਿਆਰਥੀ ਮੋਡ';
	@override String get         takeattendance => ' ਹਾਜ਼ਰੀ ਲਵੋ';
	@override String get         allocatecontent => ' ਸਮੱਗਰੀ ਨਿਰਧਾਰਿਤ ਕਰੋ';
	@override String get         review => ' ਪੜਤਾਲ';
	@override String get         managestudent => ' ਵਿਦਿਆਰਥੀ ਪਰਬੰਧ';
	@override String get         logout => ' ਲਾਗ ਆਉਟ';
	@override String get         assessment => ' ਮੁਲਾਂਕਣ';
	@override String get         loadsampledata => ' ਡਾਟਾ ਲੋਡ ਕਰੋ';
	@override String get         ekal => ' ਏਕਲ ਅਚਾਰੀਆ';
	@override String get         synced => ' ਡਾਟਾ ਸਰਵਰ ਉੱਤੇ ਸਫਲਤਾਪੂਰਵਕ ਭੇਜਿਆ ਗਿਆ';
	@override String get         notsynced => ' ਸਿੰਕ ਕਰਨਾ ਸੰਭਵ ਨਹੀਂ ਹੈ ਕਿਰਪਾ ਕਰਕੇ ਇੰਟਰਨੈੱਟ ਨਾਲ ਕਨੈਕਟ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';
	@override String get         loadeddata => ' ਡਾਟਾ ਠੀਕ ਤਰ੍ਹਾਂ ਲੋਡ ਕੀਤਾ ਗਿਆ';
	@override String get         logoutwarning => ' ਕੀ ਤੁਸੀਂ ਯਕੀਨੀ ਤੌਰ \'ਤੇ ਲੌਗਆਊਟ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get         yes => ' ਹਾਂ';
	@override String get         no => ' ਨਹੀਂ';
	@override String get         attention => ' ਧਿਆਨ ਦਿਓ!';
	@override String get         syncdata => ' ਤੁਹਾਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਜੋੜਿਆ ਗਿਆ ਹੈ ਡੇਟਾ ਡੇਟਾ ਨੂੰ ਸਿੰਕ ਕਰਨਾ ਨਾ ਭੁੱਲੋ';
}

// Path:     studentmode
class _StringsStudentmodePn implements _StringsStudentmodeEn {
	_StringsStudentmodePn._(this._root);

	@override final _StringsPn _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => '  ਵਿਦਿਆਰਥੀ ਮੋਡ';
	@override String get         selectdate => ' ਮਿਤੀ ਚੁਣੋ';
	@override String get         nocontent => ' ਕੋਈ ਵੀ ਨਿਰਧਾਰਿਤ ਸਮੱਗਰੀ ਨਹੀਂ ਲੱਭੀ';
	@override String get         selectgat => ' ਹੋਰ ਅੱਗੇ ਵਧਣ ਲਈ ਇੱਕ ਗੈਟ ਦੀ ਚੋਣ ਕਰੋ';
	@override String get         videoname => ' ਵਿਡੀਓ ਨਾਂ';
	@override String get         gat => ' Gat';
	@override String get         subject => ' ਵਿਸ਼ਾ';
	@override String get         topic => ' ਵਿਸ਼ਾ';
	@override String get         watch => ' ਵਿਡੀਓ ਵੇਖੋ';
	@override String get         nocontentforgat => ' ਚੁਣੇ ਗਏ ਗੈਟ ਲਈ ਕੋਈ ਵੀ ਨਿਰਧਾਰਤ ਸਮੱਗਰੀ ਨਹੀਂ ਲੱਭੀ ਕਿਰਪਾ ਕਰਕੇ ਪਹਿਲਾਂ ਸਮੱਗਰੀ ਨਿਰਧਾਰਤ ਕਰੋ';
	@override String get         deletecontent => ' ਨਿਯਤ ਕੀਤੀ ਸਮੱਗਰੀ ਨੂੰ ਮਿਟਾਓ';
	@override String get         deletewarning => ' ਕੀ ਤੁਸੀਂ ਵਾਕਈ ਇਸ ਨਿਯਤ ਸਮੱਗਰੀ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get         no => ' ਨਹੀਂ';
	@override String get         yes => ' ਹਾਂ';
}

// Path:     managestudents
class _StringsManagestudentsPn implements _StringsManagestudentsEn {
	_StringsManagestudentsPn._(this._root);

	@override final _StringsPn _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => '   ਵਿਦਿਆਰਥੀਆਂ ਦਾ ਪਰਬੰਧ ਕਰੋ';
	@override String get         search => ' ਖੋਜ';
	@override String get         notfound => ' ਕੋਈ ਨਤੀਜੇ ਨਹੀਂ ਲੱਭੇ';
	@override String get         addnew => ' ਨਵਾਂ ਵਿਦਿਆਰਥੀ ਸ਼ਾਮਲ';
	@override String get         age => ' ਉਮਰ';
	@override String get         cancel => ' ਰੱਦ ਕਰੋ';
	@override String get         submit => ' ਸਪੁਰਦ ਕਰੋ';
	@override String get         name => ' ਵਿਦਿਆਰਥੀ ਦਾ ਨਾਮ';
	@override String get         editstudent => ' ਵਿਦਿਆਰਥੀ ਵੇਰਵਾ ਸੋਧ';
	@override String get         deletestudent => ' ਵਿਦਿਆਰਥੀ ਵੇਰਵੇ ਹਟਾਓ';
	@override String get         deletestudentwarning => ' ਕੀ ਤੁਸੀਂ ਇਸ ਬੱਚੇ ਲਈ ਰਿਕਾਰਡਾਂ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get         delete => ' ਹਟਾਓ';
	@override String get         gat => ' Gat';
	@override String get         studentadded => ' ਵਿਦਿਆਰਥੀ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਸ਼ਾਮਲ ਕਰ ਲਿਆ ਗਿਆ ਹੈ';
}

// Path:     allocatecontent
class _StringsAllocatecontentPn implements _StringsAllocatecontentEn {
	_StringsAllocatecontentPn._(this._root);

	@override final _StringsPn _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => '    ਸਮੱਗਰੀ ਨਿਰਧਾਰਿਤ ਕਰੋ';
	@override String get         selectgat => ' ਗੈਟ ਚੁਣੋ';
	@override String get         selecttopic => ' ਵਿਸ਼ਾ ਚੁਣੋ';
	@override String get         selectvideos => ' ਵਿਡੀਓ ਚੁਣੋ';
	@override String get         selectedvideos => ' ਚੁਣੇ ਵਿਡੀਓ';
	@override String get         dateofcontent => ' ਕਿਰਪਾ ਕਰਕੇ ਸਮੱਗਰੀ ਨੂੰ ਨਿਰਧਾਰਤ ਕਰਨ ਲਈ ਕੋਈ ਮਿਤੀ ਚੁਣੋ';
	@override String get         selectdate => ' ਮਿਤੀ ਚੁਣੋ';
}

// Path:     takeattendance
class _StringsTakeattendancePn implements _StringsTakeattendanceEn {
	_StringsTakeattendancePn._(this._root);

	@override final _StringsPn _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => ' ਹਾਜ਼ਰੀ ਲਵੋ';
	@override String get         date => ' ਮਿਤੀ';
	@override String get         dashboard => 'ਡੈਸ਼ਬੋਰਡ';
	@override String get         selectgat => ' ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਗੈਟ ਦੀ ਚੋਣ ਕਰੋ';
	@override String get         selectdate => ' ਮਿਤੀ ਚੁਣੋ';
	@override String get         save => ' ਸੰਭਾਲੋ';
	@override String get         attendancenottaken => ' ਹਾਜ਼ਰੀ ਨਹੀਂ ਲਈ ਗਈ';
	@override String get         nostudent => ' ਕੋਈ ਵੀ ਵਿਦਿਆਰਥੀ ਇਸ ਗੈਟ ਲਈ ਰਜਿਸਟਰ ਨਹੀਂ ਹੈ!';
	@override String get         holiday => ' ਅੱਜ ਛੁੱਟੀ ਹੈ';
	@override String get confirmattendance => 'ਹਾਜ਼ਰੀ ਪੁਸ਼ਟੀ';
	@override String get confirmwarning => 'ਕਿਰਪਾ ਕਰਕੇ ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਤੁਸੀਂ ਇਸ ਹਾਜ਼ਰੀ ਨੂੰ ਸਪੁਰਦ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ';
	@override String get cancel => 'ਰੱਦ ਕਰੋ';
	@override String get ok => 'ਠੀਕ ਹੈ';
	@override String get attendancetaken => 'ਹਾਜ਼ਰੀ ਪਹਿਲਾਂ ਹੀ ਲਈ ਗਈ ਹੈ';
	@override String get takenwarning => 'ਤੁਸੀਂ ਅੱਜ ਹੀ ਉਸ ਗੈਟ ਵਾਸਤੇ ਹਾਜ਼ਰੀ ਲੈ ਚੁੱਕੇ ਹੋ';
}

// Path:     review
class _StringsReviewPn implements _StringsReviewEn {
	_StringsReviewPn._(this._root);

	@override final _StringsPn _root; // ignore: unused_field

	// Translations
	@override String get         review => '     ਪੜਤਾਲ';
	@override String get         selectmonth => ' ਮਹੀਨਾ ਚੁਣੋ';
	@override String get         selectgat => ' ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਗੈਟ ਦੀ ਚੋਣ ਕਰੋ';
	@override String get         attendancereview => ' ਹਾਜ਼ਰੀ ਪੜਤਾਲ';
	@override String get         quizreview => ' ਕਵਿਜ਼ ਰੀਵਿਊ';
	@override String get         videoprog => ' ਵਿਡੀਓ ਤਰੱਕੀ';
	@override String get         selectstudent => ' ਕਿਰਪਾ ਕਰਕੇ ਕੋਈ ਵਿਦਿਆਰਥੀ ਚੁਣੋ';
	@override String get         nodata => ' ਚੁਣੇ ਗਏ ਖੇਤਰਾਂ ਲਈ ਦਿਖਾਉਣ ਲਈ ਕੋਈ ਡੇਟਾ ਨਹੀਂ ਹੈ';
	@override String get         noquizgiven => ' ਕੋਈ ਕਵਿਜ਼ ਨਹੀਂ ਦਿੱਤੀ ਗਈ';
	@override String get         videono => ' ਵੀਡੀਓ ਨੰ.';
	@override String get         topic => ' ਵਿਸ਼ਾ';
	@override String get         duration => ' ਅੰਤਰਾਲ';
	@override String get         progress => ' ਤਰੱਕੀ';
	@override String get         noattendance => ' ਹਾਜ਼ਰੀ ਨਹੀਂ ਲਈ ਗਈ';
}

// Path:     assessment
class _StringsAssessmentPn implements _StringsAssessmentEn {
	_StringsAssessmentPn._(this._root);

	@override final _StringsPn _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => '     ਕਵਿੱਜ਼ ਬਣਾਓ';
	@override String get         createqs => ' ਸਵਾਲ ਬਣਾਓ';
	@override String get         createqzs => ' ਕਵਿੱਜ਼ ਬਣਾਓ';
	@override String get         allqzs => ' ਸਭ ਕਵਿੱਜ਼';
	@override String get         giveqz => ' ਕਵਿੱਜ਼ ਦਿਓ';
	@override String get         selectgat => ' ਗੈਟ ਚੁਣੋ';
	@override String get         selecttopic => ' ਵਿਸ਼ਾ ਚੁਣੋ';
	@override String get         enterq => ' ਸਵਾਲ ਦਿਓ';
	@override String get         enteroptiona => ' ਚੋਣ A ਦਰਜ਼ ਕਰੋ';
	@override String get         enteroptionb => ' ਚੋਣ B ਦਰਜ਼ ਕਰੋ';
	@override String get         enteroptionc => ' ਚੋਣ C ਦਰਜ਼ ਕਰੋ';
	@override String get         enteroptiond => ' ਚੋਣ D ਦਰਜ਼ ਕਰੋ';
	@override String get         choosea => ' ਜਵਾਬ ਚੁਣੋ';
	@override String get         optiona => ' ਚੋਣ A';
	@override String get         optionb => ' ਚੋਣ B';
	@override String get         optionc => ' ਚੋਣ C';
	@override String get         optiond => ' ਚੋਣ D ';
	@override String get         selectqs => '         ਸਵਾਲ ਚੁਣੋ   ';
	@override String get         selectatleastoneq => ' ਕਿਰਪਾ ਕਰਕੇ ਘੱਟੋ-ਘੱਟ ਇੱਕ ਸਵਾਲ ਚੁਣੋ';
	@override String get         noqs => ' ਪ੍ਰਦਰਸ਼ਿਤ ਕਰਨ ਲਈ ਕੋਈ ਸਵਾਲ ਨਹੀਂ ਹਨ';
	@override String get         makequizwarning => ' ਕੀ ਤੁਹਾਨੂੰ ਪੱਕਾ ਯਕੀਨ ਹੈ ਕਿ ਤੁਸੀਂ ਚੁਣੇ ਗਏ ਸਵਾਲਾਂ ਵਿੱਚੋਂ ਇੱਕ ਕਵਿੱਜ਼ ਬਣਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get         selectdate => ' ਮਿਤੀ ਚੁਣੋ';
	@override String get         qztime => ' ਕੁੱਲ ਕਵਿਜ਼ ਸਮਾਂ';
	@override String get         cancel => ' ਰੱਦ ਕਰੋ';
	@override String get         qzcreated => ' ਕਵਿੱਜ਼ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਇਆ ਗਿਆ ਹੈ';
	@override String get         noqzs => ' ਦਿਖਾਉਣ ਲਈ ਕੋਈ ਕਵਿਜ਼ਾਂ ਨਹੀਂ ਹਨ !!';
	@override String get         selectqz => ' ਇੱਕ ਕਵਿੱਜ਼ ਚੁਣੋ';
	@override String get         listogqzs => ' ਸਾਰੀਆਂ ਕਵਿਜ਼ਾਂ ਦੀ ਸੂਚੀ';
	@override String get         noqzsmade => ' ਹਾਲੇ ਤੱਕ ਕੋਈ ਕਵਿੱਜ਼ਾਂ ਨਹੀਂ ਬਣਾਈਆਂ ਗਈਆਂ';
	@override String get         gat => ' Gat ';
	@override String get         date => 'ਮਿਤੀ ';
	@override String get         deleteqzs => ' ਕਵਿੱਜ਼ ਹਟਾਓ';
	@override String get         deleteqzwarning => ' ਕੀ ਤੁਹਾਨੂੰ ਪੱਕਾ ਯਕੀਨ ਹੈ ਕਿ ਤੁਸੀਂ ਇਸ ਅਧਿਸੂਚਿਤ ਕਵਿਜ਼ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
	@override String get ok => 'ਠੀਕ ਹੈ';
}

// Path: <root>
class _StringsTl implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTl.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsTl _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageTl     homepage = _StringsHomepageTl._(_root);
	@override late final _StringsStudentmodeTl     studentmode = _StringsStudentmodeTl._(_root);
	@override late final _StringsManagestudentsTl     managestudents = _StringsManagestudentsTl._(_root);
	@override late final _StringsAllocatecontentTl     allocatecontent = _StringsAllocatecontentTl._(_root);
	@override late final _StringsTakeattendanceTl     takeattendance = _StringsTakeattendanceTl._(_root);
	@override late final _StringsReviewTl     review = _StringsReviewTl._(_root);
	@override late final _StringsAssessmentTl     assessment = _StringsAssessmentTl._(_root);
}

// Path:     homepage
class _StringsHomepageTl implements _StringsHomepageEn {
	_StringsHomepageTl._(this._root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' స్టూడెంట్ మోడ్';
	@override String get         takeattendance => ' హాజరు తీసుకోండి';
	@override String get         allocatecontent => ' కంటెంట్ కేటాయించు';
	@override String get         review => ' సమీక్ష';
	@override String get         managestudent => ' విద్యార్థిని నిర్వహించు';
	@override String get         logout => ' లాగ్ అవుట్';
	@override String get         assessment => ' అసెస్ మెంట్';
	@override String get         loadsampledata => ' లోడ్ డేటా';
	@override String get         ekal => ' ఏకల్ ఆచార్య';
	@override String get         synced => ' డేటా విజయవంతంగా సర్వర్ కు పంపబడింది';
	@override String get         notsynced => ' సమకాలీకరించడం సాధ్యం కాదు దయచేసి ఇంటర్నెట్ కు కనెక్ట్ కావడానికి ప్రయత్నించండి మరియు మళ్లీ ప్రయత్నించండి';
	@override String get         loadeddata => ' డేటా విజయవంతంగా లోడ్ చేయబడింది';
	@override String get         logoutwarning => ' మీరు కచ్చితంగా నిష్క్రమించాలని అనుకుంటున్నారా?';
	@override String get         yes => ' అవును';
	@override String get         no => ' కాదు';
	@override String get         attention => ' ధ్యాస!';
	@override String get         syncdata => ' మీరు విజయవంతంగా జతచేయబడ్డారు డేటాను సింక్ చేయడం మర్చిపోవద్దు';
}

// Path:     studentmode
class _StringsStudentmodeTl implements _StringsStudentmodeEn {
	_StringsStudentmodeTl._(this._root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' స్టూడెంట్ మోడ్';
	@override String get         selectdate => ' తేదీని ఎంచుకోండి';
	@override String get         nocontent => ' కేటాయించబడ్డ కంటెంట్ ఏదీ కనుగొనబడలేదు';
	@override String get         selectgat => ' తదుపరి ముందుకు సాగడం కొరకు ఒక గాట్ ఎంచుకోండి';
	@override String get         videoname => ' వీడియో పేరు';
	@override String get         gat => ' గాట్';
	@override String get         subject => ' పాలితుడు';
	@override String get         topic => ' అంశం';
	@override String get         watch => ' వీడియో చూడండి';
	@override String get         nocontentforgat => ' ఎంపిక చేయబడ్డ గట్ కొరకు కేటాయించబడ్డ కంటెంట్ ఏదీ కనుగొనబడలేదు దయచేసి మొదట కంటెంట్ ని కేటాయించండి';
	@override String get         deletecontent => ' కేటాయించిన కంటెంట్ ని డిలీట్ చేయండి';
	@override String get         deletewarning => ' ఈ కేటాయించబడ్డ కంటెంట్ ని మీరు కచ్చితంగా డిలీట్ చేయాలని అనుకుంటున్నారా?';
	@override String get         no => ' కాదు';
	@override String get         yes => ' అవును';
}

// Path:     managestudents
class _StringsManagestudentsTl implements _StringsManagestudentsEn {
	_StringsManagestudentsTl._(this._root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => '  విద్యార్థులను నిర్వహించండి';
	@override String get         search => ' వెతుకు';
	@override String get         notfound => ' ఎలాంటి ఫలితాలు కనుగొనబడలేదు';
	@override String get         addnew => ' కొత్త విద్యార్థిని జోడించు';
	@override String get         age => ' వయసు';
	@override String get         cancel => ' రద్దు';
	@override String get         submit => ' సమర్పించు';
	@override String get         name => ' విద్యార్థి పేరు';
	@override String get         editstudent => ' విద్యార్థి వివరాలను సవరించు';
	@override String get         deletestudent => ' విద్యార్థి వివరాలను డిలీట్ చేయండి';
	@override String get         deletestudentwarning => ' ఈ బిడ్డ కొరకు రికార్డ్ లను మీరు డిలీట్ చేయాలని అనుకుంటున్నారా?';
	@override String get         delete => ' పరిహరించు';
	@override String get         gat => ' గాట్';
	@override String get         studentadded => ' విద్యార్థి విజయవంతంగా జోడించబడ్డాడు';
}

// Path:     allocatecontent
class _StringsAllocatecontentTl implements _StringsAllocatecontentEn {
	_StringsAllocatecontentTl._(this._root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => ' కంటెంట్ కేటాయించు';
	@override String get         selectgat => ' గాట్ ఎంచుకోండి';
	@override String get         selecttopic => ' టాపిక్ ఎంచుకోండి';
	@override String get         selectvideos => ' వీడియోలను ఎంచుకోండి';
	@override String get         selectedvideos => ' ఎంచుకున్న వీడియోలు';
	@override String get         dateofcontent => ' కంటెంట్ కేటాయించడం కొరకు దయచేసి ఒక తేదీని ఎంచుకోండి';
	@override String get         selectdate => ' తేదీని ఎంచుకోండి';
}

// Path:     takeattendance
class _StringsTakeattendanceTl implements _StringsTakeattendanceEn {
	_StringsTakeattendanceTl._(this._root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => ' హాజరు తీసుకోండి';
	@override String get         date => ' ఖర్జూరం';
	@override String get         dashboard => ' డ్యాష్ బోర్డ్';
	@override String get         selectgat => ' దయచేసి ఒక గాట్ ఎంచుకోండి';
	@override String get         selectdate => ' తేదీని ఎంచుకోండి';
	@override String get         save => ' కాపాడు';
	@override String get         attendancenottaken => ' హాజరు తీసుకోబడలేదు';
	@override String get         nostudent => ' ఏ విద్యార్థి కూడా ఈ గాట్ కొరకు రిజిస్టర్ చేసుకోలేదు!';
	@override String get         holiday => ' ఈ రోజు సెలవుదినం';
	@override String get confirmattendance => 'హాజరును ధృవీకరించండి';
	@override String get confirmwarning => 'ఈ హాజరును మీరు సబ్మిట్ చేయాలని అనుకుంటున్నట్లుగా దయచేసి ధృవీకరించండి.';
	@override String get cancel => 'రద్దు';
	@override String get ok => 'సరే';
	@override String get attendancetaken => 'హాజరు ఇప్పటికే తీసుకోబడింది';
	@override String get takenwarning => 'ఈ రోజు ఆ గాట్ కొరకు మీరు ఇప్పటికే అటెండెన్స్ తీసుకున్నారు.';
}

// Path:     review
class _StringsReviewTl implements _StringsReviewEn {
	_StringsReviewTl._(this._root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get         review => ' సమీక్ష';
	@override String get         selectmonth => ' నెలను ఎంచుకోండి';
	@override String get         selectgat => ' దయచేసి ఒక గాట్ ఎంచుకోండి';
	@override String get         attendancereview => ' హాజరు సమీక్ష';
	@override String get         quizreview => ' క్విజ్ రివ్యూ';
	@override String get         videoprog => ' వీడియో పురోగతి';
	@override String get         selectstudent => ' దయచేసి ఒక విద్యార్థిని ఎంచుకోండి';
	@override String get         nodata => ' ఎంపిక చేయబడ్డ ఫీల్డ్ ల కొరకు చూపించడానికి ఎలాంటి డేటా లేదు';
	@override String get         noquizgiven => ' క్విజ్ లు ఏవీ ఇవ్వబడలేదు';
	@override String get         videono => ' వీడియో నెంబరు.';
	@override String get         topic => ' అంశం';
	@override String get         duration => ' గడువు';
	@override String get         progress => ' ప్రగతి';
	@override String get         noattendance => ' హాజరు తీసుకోబడలేదు';
}

// Path:     assessment
class _StringsAssessmentTl implements _StringsAssessmentEn {
	_StringsAssessmentTl._(this._root);

	@override final _StringsTl _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => ' క్విజ్ సృష్టించు';
	@override String get         createqs => ' ప్రశ్నలు సృష్టించండి';
	@override String get         createqzs => ' క్విజ్ లను సృష్టించండి';
	@override String get         allqzs => ' అన్ని క్విజ్ లు';
	@override String get         giveqz => ' క్విజ్ ఇవ్వండి';
	@override String get         selectgat => ' గాట్ ను ఎంచుకోండి';
	@override String get         selecttopic => ' టాపిక్ ఎంచుకోండి';
	@override String get         enterq => ' ప్రశ్న నమోదు చేయండి';
	@override String get         enteroptiona => ' ఆప్షన్ A ఎంటర్ చేయండి';
	@override String get         enteroptionb => ' ఆప్షన్ B ఎంటర్ చేయండి';
	@override String get         enteroptionc => ' ఆప్షన్ C ఎంటర్ చేయండి';
	@override String get         enteroptiond => ' ఆప్షన్ D ఎంటర్ చేయండి';
	@override String get         choosea => ' సమాధానం ఎంచుకోండి';
	@override String get         optiona => ' ఆప్షన్ A';
	@override String get         optionb => ' ఆప్షన్ B';
	@override String get         optionc => ' ఆప్షన్ C';
	@override String get         optiond => ' ఆప్షన్ D ';
	@override String get         selectqs => '    ప్రశ్నలను ఎంచుకోండి';
	@override String get         selectatleastoneq => ' దయచేసి కనీసం ఒక ప్రశ్నను ఎంచుకోండి';
	@override String get         noqs => ' ప్రదర్శించడానికి ఎలాంటి ప్రశ్నలు లేవు';
	@override String get         makequizwarning => ' ఎంపిక చేయబడ్డ ప్రశ్నల నుంచి క్విజ్ చేయాలని మీరు ఖచ్చితంగా అనుకుంటున్నారా?';
	@override String get         selectdate => ' తేదీని ఎంచుకోండి';
	@override String get         qztime => ' మొత్తం క్విజ్ సమయం';
	@override String get         cancel => ' రద్దు';
	@override String get         qzcreated => ' క్విజ్ విజయవంతంగా సృష్టించబడింది';
	@override String get         noqzs => ' !! చూపించడానికి క్విజ్ లు లేవు';
	@override String get         selectqz => ' క్విజ్ ఎంచుకోండి';
	@override String get         listogqzs => ' అన్ని క్విజ్ ల జాబితా';
	@override String get         noqzsmade => ' ఇంకా క్విజ్ లు తయారు చేయబడలేదు';
	@override String get         gat => ' గాట్ ';
	@override String get         date => 'ఖర్జూరం ';
	@override String get         deleteqzs => ' క్విజ్ ని డిలీట్ చేయండి';
	@override String get         deleteqzwarning => ' ఈ కేటాయించబడ్డ క్విజ్ ని మీరు కచ్చితంగా డిలీట్ చేయాలని అనుకుంటున్నారా?';
	@override String get ok => 'సరే';
}

// Path: <root>
class _StringsTm implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTm.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsTm _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageTm homepage = _StringsHomepageTm._(_root);
	@override late final _StringsStudentmodeTm studentmode = _StringsStudentmodeTm._(_root);
	@override late final _StringsManagestudentsTm managestudents = _StringsManagestudentsTm._(_root);
	@override late final _StringsAllocatecontentTm allocatecontent = _StringsAllocatecontentTm._(_root);
	@override late final _StringsTakeattendanceTm takeattendance = _StringsTakeattendanceTm._(_root);
	@override late final _StringsReviewTm review = _StringsReviewTm._(_root);
	@override late final _StringsAssessmentTm assessment = _StringsAssessmentTm._(_root);
}

// Path: homepage
class _StringsHomepageTm implements _StringsHomepageEn {
	_StringsHomepageTm._(this._root);

	@override final _StringsTm _root; // ignore: unused_field

	// Translations
	@override String get studentmode => 'மாணவர் முறை';
	@override String get takeattendance => 'வருகையை எடுத்துக் கொள்ளுங்கள்';
	@override String get allocatecontent => 'உள்ளடக்கத்தை ஒதுக்கு';
	@override String get review => 'மறுசீராய்வு';
	@override String get managestudent => 'மாணவரை நிர்வகித்தல்';
	@override String get logout => 'வெளியேறு';
	@override String get assessment => 'மதிப்பீடு';
	@override String get loadsampledata => 'தரவை ஏற்றுதல்';
	@override String get ekal => 'ஏகல் ஆச்சார்யா';
	@override String get synced => 'தரவு வெற்றிகரமாக சேவையகத்திற்கு அனுப்பப்பட்டது';
	@override String get notsynced => 'ஒத்திசைக்கப்பட்டது சாத்தியமில்லை தயவுசெய்து இணையத்துடன் இணைக்க முயற்சி செய்து மீண்டும் முயற்சிக்கவும்';
	@override String get loadeddata => 'ஏற்றப்பட்ட தரவு வெற்றிகரமாக';
	@override String get logoutwarning => 'நிச்சயமாக வெளியேற விரும்புகிறீர்களா?';
	@override String get yes => 'ஆம்';
	@override String get no => 'இல்லை';
	@override String get attention => 'கவனம்!';
	@override String get syncdata => 'நீங்கள் வெற்றிகரமாக சேர்க்கப்பட்டுள்ளீர்கள் தரவை ஒத்திசைக்க மறக்காதீர்கள் தரவு';
}

// Path: studentmode
class _StringsStudentmodeTm implements _StringsStudentmodeEn {
	_StringsStudentmodeTm._(this._root);

	@override final _StringsTm _root; // ignore: unused_field

	// Translations
	@override String get studentmode => 'மாணவர் முறை';
	@override String get selectdate => 'தேதி தேர்ந்தெடு`';
	@override String get nocontent => 'ஒதுக்கப்பட்ட உள்ளடக்கம் எதுவும் காணப்படவில்லை';
	@override String get selectgat => 'மேலும் தொடர ஒரு Gat ஐத் தேர்ந்தெடுக்கவும்';
	@override String get videoname => 'வீடியோ பெயர்';
	@override String get gat => 'காட்';
	@override String get subject => 'குடிமகன்';
	@override String get topic => 'தலைப்பு';
	@override String get watch => 'வீடியோவைப் பார்க்கவும்';
	@override String get nocontentforgat => 'தேர்ந்தெடுக்கப்பட்ட Gat க்கு ஒதுக்கப்பட்ட உள்ளடக்கம் எதுவும் காணப்படவில்லை தயவுசெய்து முதலில் உள்ளடக்கத்தை ஒதுக்கவும்';
	@override String get deletecontent => 'ஒதுக்கப்பட்ட உள்ளடக்கத்தை நீக்கு';
	@override String get deletewarning => 'இந்த ஒதுக்கப்பட்ட உள்ளடக்கத்தை நீக்க நிச்சயமாக விரும்புகிறீர்களா?';
	@override String get no => 'இல்லை';
	@override String get yes => 'ஆம்';
}

// Path: managestudents
class _StringsManagestudentsTm implements _StringsManagestudentsEn {
	_StringsManagestudentsTm._(this._root);

	@override final _StringsTm _root; // ignore: unused_field

	// Translations
	@override String get managestudents => 'மாணவர்களை நிர்வகித்தல்';
	@override String get search => 'தேட்டம்';
	@override String get notfound => 'முடிவுகள் எதுவும் காணப்படவில்லை';
	@override String get addnew => 'புதிய மாணவரை சேர்';
	@override String get age => 'வாழ்நாள்';
	@override String get cancel => 'ரத்து';
	@override String get submit => 'சமர்ப்பிக்க';
	@override String get name => 'மாணவரின் பெயர்';
	@override String get editstudent => 'மாணவர் விவரங்களைத் திருத்து';
	@override String get deletestudent => 'மாணவர் விவரங்களை நீக்கு';
	@override String get deletestudentwarning => 'இந்தக் குழந்தைக்கான பதிவேடுகளை நீக்க விரும்புகிறீர்களா?';
	@override String get delete => 'தீங்கான';
	@override String get gat => 'காட்';
	@override String get studentadded => 'மாணவர் வெற்றிகரமாகச் சேர்க்கப்பட்டுள்ளார்';
}

// Path: allocatecontent
class _StringsAllocatecontentTm implements _StringsAllocatecontentEn {
	_StringsAllocatecontentTm._(this._root);

	@override final _StringsTm _root; // ignore: unused_field

	// Translations
	@override String get allocatecontent => 'உள்ளடக்கத்தை ஒதுக்கு';
	@override String get selectgat => 'கேட் தேர்ந்தெடு';
	@override String get selecttopic => 'தலைப்பை தேர்ந்தெடு';
	@override String get selectvideos => 'வீடியோக்களைத் தேர்ந்தெடுக்கவும்';
	@override String get selectedvideos => 'தேர்ந்தெடுக்கப்பட்ட\nவீடியோக்கள்';
	@override String get dateofcontent => 'உள்ளடக்கத்தை ஒதுக்க ஒரு தேதியை தேர்ந்தெடுக்கவும்';
	@override String get selectdate => 'தேதி தேர்ந்தெடு';
}

// Path: takeattendance
class _StringsTakeattendanceTm implements _StringsTakeattendanceEn {
	_StringsTakeattendanceTm._(this._root);

	@override final _StringsTm _root; // ignore: unused_field

	// Translations
	@override String get takeattendance => 'வருகையை எடுத்துக் கொள்ளுங்கள்';
	@override String get date => 'பேரீச்ச மரம்';
	@override String get dashboard => 'சேற்றுக்காப்பு';
	@override String get selectgat => 'தயவுசெய்து ஒரு Gat ஐத் தேர்ந்தெடுக்கவும்';
	@override String get selectdate => 'தேதி தேர்ந்தெடு';
	@override String get save => 'கெலிப்புத்தடங்கல்';
	@override String get attendancenottaken => 'வருகைப் பதிவு\nஎடுக்கப்படவில்லை';
	@override String get nostudent => 'இந்த Gat க்கு எந்த மாணவரும் பதிவு செய்யவில்லை!';
	@override String get holiday => 'இன்று விடுமுறை நாள்';
	@override String get confirmattendance => 'வருகையை உறுதிப்படுத்தவும்';
	@override String get confirmwarning => 'இந்த வருகையை நீங்கள் சமர்ப்பிக்க விரும்புகிறீர்கள் என்பதை உறுதிப்படுத்தவும்';
	@override String get cancel => 'ரத்து';
	@override String get ok => 'சரி';
	@override String get attendancetaken => 'ஏற்கனவே எடுக்கப்பட்ட வருகை';
	@override String get takenwarning => 'நீங்கள் ஏற்கனவே இன்று அந்த gat க்கான வருகையை எடுத்துள்ளீர்கள்';
}

// Path: review
class _StringsReviewTm implements _StringsReviewEn {
	_StringsReviewTm._(this._root);

	@override final _StringsTm _root; // ignore: unused_field

	// Translations
	@override String get review => 'மறுசீராய்வு';
	@override String get selectmonth => 'மாதம் தேர்ந்தெடு';
	@override String get selectgat => 'தயவுசெய்து ஒரு Gat ஐத் தேர்ந்தெடுக்கவும்';
	@override String get attendancereview => 'வருகை மீளாய்வு';
	@override String get quizreview => 'வினாடி வினா விமர்சனம்';
	@override String get videoprog => 'வீடியோ முன்னேற்றம்';
	@override String get selectstudent => 'தயவுசெய்து ஒரு மாணவரைத் தேர்ந்தெடுக்கவும்';
	@override String get nodata => 'தேர்ந்தெடுத்த புலங்களுக்கு காண்பிக்க தரவு இல்லை';
	@override String get noquizgiven => 'வினாடி வினாக்கள் எதுவும் கொடுக்கப்படவில்லை';
	@override String get videono => 'வீடியோ எண்.';
	@override String get topic => 'தலைப்பு';
	@override String get duration => 'காலத்தொடர்ச்சி';
	@override String get progress => 'முன்னேற்றம்';
	@override String get noattendance => 'வருகைப் பதிவு எடுக்கப்படவில்லை';
}

// Path: assessment
class _StringsAssessmentTm implements _StringsAssessmentEn {
	_StringsAssessmentTm._(this._root);

	@override final _StringsTm _root; // ignore: unused_field

	// Translations
	@override String get createquiz => 'வினாடி வினாவை உருவாக்கு';
	@override String get createqs => 'கேள்விகளை உருவாக்கு';
	@override String get createqzs => 'வினாடி வினாக்களை உருவாக்கு';
	@override String get allqzs => 'அனைத்து வினாடி வினாக்கள்';
	@override String get giveqz => 'வினாடி வினா கொடுங்கள்';
	@override String get selectgat => 'கேட் தேர்ந்தெடு';
	@override String get selecttopic => 'தலைப்பை தேர்ந்தெடு';
	@override String get enterq => 'கேள்வியை உள்ளிடவும்';
	@override String get enteroptiona => 'விருப்பம் A ஐ உள்ளிடவும்';
	@override String get enteroptionb => 'விருப்பம் B ஐ உள்ளிடவும்';
	@override String get enteroptionc => 'விருப்பம் C ஐ உள்ளிடவும்';
	@override String get enteroptiond => 'விருப்பம் D ஐ உள்ளிடவும்';
	@override String get choosea => 'பதில் தேர்ந்தெடு';
	@override String get optiona => 'விருப்பம் A';
	@override String get optionb => 'விருப்பம் B';
	@override String get optionc => 'விருப்பம் C';
	@override String get optiond => 'விருப்பம் D ';
	@override String get selectqs => 'கேள்விகளைத் தேர்ந்தெடுங்கள்';
	@override String get selectatleastoneq => 'தயவுசெய்து குறைந்தபட்சம் ஒரு கேள்வியையாவது தேர்ந்தெடுக்கவும்';
	@override String get noqs => 'காண்பிக்க கேள்விகள் இல்லை';
	@override String get makequizwarning => 'தேர்ந்தெடுக்கப்பட்ட கேள்விகளில் இருந்து ஒரு வினாடி வினாவை உருவாக்க நிச்சயமாக விரும்புகிறீர்களா?';
	@override String get selectdate => 'தேதி தேர்ந்தெடு';
	@override String get qztime => 'மொத்த வினாடி வினா நேரம்';
	@override String get cancel => 'ரத்து';
	@override String get ok => 'சரி';
	@override String get qzcreated => 'வினாடி வினா வெற்றிகரமாக உருவாக்கப்பட்டது';
	@override String get noqzs => 'காண்பிக்க வினாடி வினாக்கள் இல்லை';
	@override String get selectqz => 'வினாடி வினாவைத் தேர்ந்தெடுக்கவும்';
	@override String get listogqzs => 'அனைத்து வினாடி வினாக்களின் பட்டியல்';
	@override String get noqzsmade => 'இன்னும் வினாடி வினாக்கள் இல்லை';
	@override String get gat => 'காட் ';
	@override String get date => 'பேரீச்ச மரம் ';
	@override String get deleteqzs => 'ஒரு வினாடி வினாவை நீக்கு';
	@override String get deleteqzwarning => 'இந்த ஒதுக்கப்பட்ட வினாடி வினாவை நீக்க நிச்சயமாக விரும்புகிறீர்களா?';
}

// Path: <root>
class _StringsUr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsUr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsUr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomepageUr     homepage = _StringsHomepageUr._(_root);
	@override late final _StringsStudentmodeUr     studentmode = _StringsStudentmodeUr._(_root);
	@override late final _StringsManagestudentsUr     managestudents = _StringsManagestudentsUr._(_root);
	@override late final _StringsAllocatecontentUr     allocatecontent = _StringsAllocatecontentUr._(_root);
	@override late final _StringsTakeattendanceUr     takeattendance = _StringsTakeattendanceUr._(_root);
	@override late final _StringsReviewUr     review = _StringsReviewUr._(_root);
	@override late final _StringsAssessmentUr     assessment = _StringsAssessmentUr._(_root);
}

// Path:     homepage
class _StringsHomepageUr implements _StringsHomepageEn {
	_StringsHomepageUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => '   طالب علم موڈ';
	@override String get         takeattendance => ' حاضری لیں';
	@override String get         allocatecontent => ' مواد مختص کریں';
	@override String get         review => ' جائزہ';
	@override String get         managestudent => ' طالب علم کا انتظام کریں';
	@override String get         logout => ' لاگ آؤٹ کریں';
	@override String get         assessment => ' تشخیص';
	@override String get         loadsampledata => ' کوائف لوڈ کریں';
	@override String get         ekal => ' ایکل آچاریہ';
	@override String get         synced => ' پیش کار کو کامیابی سے کوائف بھیجے گئے';
	@override String get         notsynced => ' ہم آہنگ ممکن نہیں براہ کرم انٹرنیٹ سے جڑنے کی کوشش کریں اور دوبارہ کوشش کریں';
	@override String get         loadeddata => ' لوڈ شدہ کوائف کامیابی سے';
	@override String get         logoutwarning => ' کیا آپ کو یقین ہے کہ آپ لاگ آؤٹ کرنا چاہتے ہیں؟';
	@override String get         yes => ' ہاں';
	@override String get         no => ' نہيں';
	@override String get         attention => ' توجہ!';
	@override String get         syncdata => ' آپ کو کامیابی سے شامل کیا جاتا ہے ڈیٹا کوائف کو سنک کرنا نہیں بھولتا';
}

// Path:     studentmode
class _StringsStudentmodeUr implements _StringsStudentmodeEn {
	_StringsStudentmodeUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get         studentmode => ' طالب علم موڈ';
	@override String get         selectdate => ' تاریخ منتخب کریں';
	@override String get         nocontent => ' کوئی مختص مواد نہیں ملا';
	@override String get         selectgat => ' مزید آگے بڑھنے کے لیے ایک گیٹ منتخب کریں';
	@override String get         videoname => ' ویڈیو نام';
	@override String get         gat => ' گیٹ';
	@override String get         subject => ' موضوع';
	@override String get         topic => ' موضوع';
	@override String get         watch => ' ویڈیو دیکھیں';
	@override String get         nocontentforgat => ' منتخب گیٹ کے لئے کوئی مختص مواد نہیں ملا براہ کرم پہلے مواد مختص کریں';
	@override String get         deletecontent => ' مختص کردہ مواد حذف کریں';
	@override String get         deletewarning => ' کیا آپ اس مختص شدہ مواد کو حذف کرنا چاہتے ہیں؟';
	@override String get         no => ' نہيں';
	@override String get         yes => ' ہاں';
}

// Path:     managestudents
class _StringsManagestudentsUr implements _StringsManagestudentsEn {
	_StringsManagestudentsUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get         managestudents => '  طلباء کا انتظام کریں';
	@override String get         search => ' تلاش';
	@override String get         notfound => ' کوئی نتائج نہیں ملے';
	@override String get         addnew => ' نیا طالب علم شامل کریں';
	@override String get         age => ' عمر';
	@override String get         cancel => ' منسوخ';
	@override String get         submit => ' جمع کرائیں';
	@override String get         name => ' طالب علم کا نام';
	@override String get         editstudent => ' طالب علم کی تفصیلات تدوین کریں';
	@override String get         deletestudent => ' طالب علم کی تفصیلات حذف کریں';
	@override String get         deletestudentwarning => ' کیا آپ اس بچے کے ریکارڈ حذف کرنا چاہتے ہیں؟';
	@override String get         delete => ' مٹانا';
	@override String get         gat => ' گیٹ';
	@override String get         studentadded => ' طالب علم کو کامیابی سے شامل کیا گیا ہے';
}

// Path:     allocatecontent
class _StringsAllocatecontentUr implements _StringsAllocatecontentEn {
	_StringsAllocatecontentUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get         allocatecontent => ' مواد مختص کریں';
	@override String get         selectgat => ' گٹ منتخب کریں';
	@override String get         selecttopic => ' موضوع منتخب کریں';
	@override String get         selectvideos => ' ویڈیوز منتخب کریں';
	@override String get         selectedvideos => ' منتخب ویڈیوز';
	@override String get         dateofcontent => ' مشمول مختص کرنے کے لیے براہ کرم تاریخ منتخب کریں';
	@override String get         selectdate => ' تاریخ منتخب کریں';
}

// Path:     takeattendance
class _StringsTakeattendanceUr implements _StringsTakeattendanceEn {
	_StringsTakeattendanceUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get         takeattendance => ' حاضری لیں';
	@override String get         date => ' تاریخ';
	@override String get         dashboard => ' ڈیش بورڈ';
	@override String get         selectgat => ' براہ کرم ایک گیٹ منتخب کریں';
	@override String get         selectdate => ' تاریخ منتخب کریں';
	@override String get         save => ' بچانا';
	@override String get         attendancenottaken => ' حاضری نہیں لی گئی';
	@override String get         nostudent => ' اس گیٹ کے لئے کوئی طالب علم رجسٹر نہیں ہے!';
	@override String get         holiday => ' آج چھٹی ہے';
	@override String get confirmattendance => 'حاضری کی تصدیق کریں';
	@override String get confirmwarning => 'براہ کرم تصدیق کریں کہ آپ یہ حاضری جمع کرانا چاہتے ہیں';
	@override String get cancel => 'منسوخ';
	@override String get ok => 'ٹھيک ہے';
	@override String get attendancetaken => 'حاضری پہلے ہی لی گئی ہے';
	@override String get takenwarning => 'آپ آج اس گیٹ کے لئے حاضری لے چکے ہیں';
}

// Path:     review
class _StringsReviewUr implements _StringsReviewEn {
	_StringsReviewUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get         review => ' جائزہ';
	@override String get         selectmonth => ' مہینہ منتخب کریں';
	@override String get         selectgat => ' براہ کرم ایک گیٹ منتخب کریں';
	@override String get         attendancereview => ' حاضری کا جائزہ';
	@override String get         quizreview => ' کوئز جائزہ';
	@override String get         videoprog => ' ویڈیو پیش رفت';
	@override String get         selectstudent => ' براہ کرم طالب علم منتخب کریں';
	@override String get         nodata => ' منتخب قطعات کے لیے دکھانے کے لیے کوائف نہیں';
	@override String get         noquizgiven => ' کوئی کوئز نہیں دیا گیا';
	@override String get         videono => ' ویڈیو نمبر';
	@override String get         topic => ' موضوع';
	@override String get         duration => ' دورانیہ';
	@override String get         progress => ' ارتقا';
	@override String get         noattendance => ' حاضری نہیں لی گئی';
}

// Path:     assessment
class _StringsAssessmentUr implements _StringsAssessmentEn {
	_StringsAssessmentUr._(this._root);

	@override final _StringsUr _root; // ignore: unused_field

	// Translations
	@override String get         createquiz => '  کوئز بنائیں';
	@override String get         createqs => ' سوالات بنائیں';
	@override String get         createqzs => ' کوئز بنائیں';
	@override String get         allqzs => ' تمام کوئز';
	@override String get         giveqz => ' کوئز دیں';
	@override String get         selectgat => ' گٹ منتخب کریں';
	@override String get         selecttopic => ' موضوع منتخب کریں';
	@override String get         enterq => ' سوال درج کریں';
	@override String get         enteroptiona => ' اختیار داخل کریں اے';
	@override String get         enteroptionb => ' اختیار بی درج کریں';
	@override String get         enteroptionc => ' اختیار سی درج کریں';
	@override String get         enteroptiond => ' اختیار ڈی درج کریں';
	@override String get         choosea => ' جواب منتخب کریں';
	@override String get         optiona => ' اختیار اے';
	@override String get         optionb => ' آپشن بی';
	@override String get         optionc => ' اختیار سی';
	@override String get         optiond => ' آپشن ڈی ';
	@override String get         selectqs => '    سوالات منتخب کریں   ';
	@override String get         selectatleastoneq => ' براہ کرم کم از کم ایک سوال منتخب کریں';
	@override String get         noqs => ' دکھانے کے لیے کوئی سوال نہیں';
	@override String get         makequizwarning => ' کیا آپ کو یقین ہے کہ آپ منتخب سوالات میں سے ایک کوئز بنانا چاہتے ہیں؟';
	@override String get         selectdate => ' تاریخ منتخب کریں';
	@override String get         qztime => ' کل کوئز وقت';
	@override String get         cancel => ' منسوخ';
	@override String get         qzcreated => ' کوئز کامیابی سے بنایا گیا ہے';
	@override String get         noqzs => ' دکھانے کے لئے کوئی کوئز !!';
	@override String get         selectqz => ' کوئز منتخب کریں';
	@override String get         listogqzs => ' فہرست تمام کوئز';
	@override String get         noqzsmade => ' ابھی تک کوئی کوئز نہیں بنایا گیا';
	@override String get         gat => ' گیٹ ';
	@override String get         date => 'تاریخ ';
	@override String get         deleteqzs => ' کوئز حذف کریں';
	@override String get         deleteqzwarning => ' کیا آپ کو یقین ہے کہ آپ اس مختص کوئز کو حذف کرنا چاہتے ہیں؟';
	@override String get ok => 'ٹھيک ہے';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'homepage.studentmode': 'Student Mode',
			'homepage.takeattendance': 'Take Attendance',
			'homepage.allocatecontent': 'Allocate\nContent',
			'homepage.review': 'Review',
			'homepage.managestudent': 'Manage\nStudent',
			'homepage.logout': 'Log Out',
			'homepage.assessment': 'Assessment',
			'homepage.loadsampledata': 'Load Data',
			'homepage.ekal': 'Ekal Acharya',
			'homepage.synced': 'data successfully sent to the server',
			'homepage.notsynced': 'Synced not possible please try to connect to internet and try again',
			'homepage.loadeddata': 'Loaded Data Successfully',
			'homepage.logoutwarning': 'Are you sure you want to logout?',
			'homepage.yes': 'Yes',
			'homepage.no': 'No',
			'homepage.attention': 'Attention!',
			'homepage.syncdata': 'You are successfully added the data do not forgot to sync the data',
			'studentmode.studentmode': 'Student Mode',
			'studentmode.selectdate': 'Select Date:   ',
			'studentmode.nocontent': 'No Allocated Content Found',
			'studentmode.selectgat  ': 'Select a Gat to proceed further:',
			'studentmode.videoname': 'Video Name',
			'studentmode.gat': 'Gat',
			'studentmode.subject': 'Subject',
			'studentmode.topic': 'Topic',
			'studentmode.watch': 'Watch Video',
			'studentmode.nocontentforgat': 'No Allocated Content Found for the selected Gat\n\nPlease Allocate content first',
			'studentmode.deletecontent': 'Delete a Allocated content',
			'studentmode.deletewarning': 'Are you sure you want to delete this Allocated Content ?',
			'studentmode.no': 'No',
			'studentmode.yes': 'Yes',
			'managestudents.managestudents': 'Manage Students',
			'managestudents.search': 'Search',
			'managestudents.notfound': 'No Results Found',
			'managestudents.addnew': 'Add New Student',
			'managestudents.age': 'Age: ',
			'managestudents.cancel': 'Cancel',
			'managestudents.submit': 'Submit',
			'managestudents.name': 'Name of Student',
			'managestudents.editstudent': 'Edit Student Details',
			'managestudents.deletestudent': 'Delete Student Details',
			'managestudents.deletestudentwarning': 'Do you want to delete the records for this child?',
			'managestudents.delete': 'Delete',
			'managestudents.gat': 'Gat: ',
			'managestudents.studentadded': 'The student has been added successfully',
			'allocatecontent.allocatecontent': 'Allocate Content',
			'allocatecontent.selectgat': 'Select Gat',
			'allocatecontent.selecttopic': 'Select Topic',
			'allocatecontent.selectvideos': 'Select Videos',
			'allocatecontent.selectedvideos': 'Selected Videos',
			'allocatecontent.dateofcontent': 'Please select a date to allocate the content',
			'allocatecontent.selectdate': 'Select Date:   ',
			'takeattendance.takeattendance': 'Take Attendance',
			'takeattendance.date': 'Date:  ',
			'takeattendance.dashboard': 'DashBoard',
			'takeattendance.selectgat': 'Please Select a Gat',
			'takeattendance.selectdate': 'Select Date',
			'takeattendance.save': 'Save',
			'takeattendance.attendancenottaken': 'Attendance Not Taken',
			'takeattendance.nostudent': 'No student is register for this Gat!',
			'takeattendance.holiday': 'Today is Holiday',
			'takeattendance.confirmattendance': 'Confirm Attendance',
			'takeattendance.confirmwarning': 'Please confirm that you want to submit this attendance',
			'takeattendance.cancel': 'Cancel',
			'takeattendance.ok': 'ok',
			'takeattendance.attendancetaken': 'Attendance already taken',
			'takeattendance.takenwarning': 'You have already taken the attendance for that gat today',
			'review.review': 'Review',
			'review.selectmonth': 'Select Month: ',
			'review.selectgat': 'Please Select a Gat',
			'review.attendancereview': 'Attendance Review',
			'review.quizreview': 'Quiz Review',
			'review.videoprog': 'Video Progress',
			'review.selectstudent': 'Please Select a Student',
			'review.nodata': 'No Data to Show for the Selected Fields',
			'review.noquizgiven': 'No Quizzes Given',
			'review.videono': 'Video No.',
			'review.topic': 'Topic',
			'review.duration': 'Duration',
			'review.progress': 'Progress',
			'review.noattendance': 'Attendance not Taken',
			'assessment.createquiz': 'Create Quiz',
			'assessment.createqs': 'Create Questions',
			'assessment.createqzs': 'Create Quizzes',
			'assessment.allqzs': 'All Quizzes',
			'assessment.giveqz': 'Give Quiz',
			'assessment.selectgat': 'Select Gat:  ',
			'assessment.selecttopic': 'Select Topic:  ',
			'assessment.enterq': 'Enter Question',
			'assessment.enteroptiona': 'Enter Option A',
			'assessment.enteroptionb': 'Enter Option B',
			'assessment.enteroptionc': 'Enter Option C',
			'assessment.enteroptiond': 'Enter Option D',
			'assessment.choosea': 'Choose Answer',
			'assessment.optiona': 'Option A',
			'assessment.optionb': 'Option B',
			'assessment.optionc': 'Option C',
			'assessment.optiond': 'Option D',
			'assessment.selectqs': '   Select Questions   ',
			'assessment.selectatleastoneq': 'Please select at least one question',
			'assessment.noqs': 'No Questions to Display',
			'assessment.makequizwarning': 'Are you sure you want to make a quiz out of the selected questions?',
			'assessment.selectdate': 'Select Date:   ',
			'assessment.qztime': 'Total Quiz Time:   ',
			'assessment.cancel': 'Cancel',
			'assessment.qzcreated': 'The quiz has been created successfully',
			'assessment.noqzs': 'No Quizzes to show !!',
			'assessment.selectqz': 'Select a Quiz',
			'assessment.listogqzs': 'List Of All Quizzes',
			'assessment.noqzsmade': 'No Quizzes Made Yet',
			'assessment.gat': 'Gat : ',
			'assessment.date': 'Date :  ',
			'assessment.deleteqzs': 'Delete a Quiz',
			'assessment.deleteqzwarning': 'Are you sure you want to delete this Allocated Quiz ?',
			'assessment.ok': 'ok',
		};
	}
}

extension on _StringsAs {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': ' শিক্ষাৰ্থী মোড',
			'    homepage.        takeattendance': ' উপস্থিতি লওক',
			'    homepage.        allocatecontent': ' সমল আবন্টন কৰক',
			'    homepage.        review': ' পৰ্যালোচনা',
			'    homepage.        managestudent': ' শিক্ষাৰ্থী পৰিচালনা কৰক',
			'    homepage.        logout': ' লগ আউট কৰক',
			'    homepage.        assessment': ' মূল্যায়ন',
			'    homepage.        loadsampledata': ' তথ্য লোড কৰক',
			'    homepage.        ekal': ' একল আচাৰ্য',
			'    homepage.        synced': ' সাৰ্ভাৰলৈ সফলতাৰে প্ৰেৰণ কৰা তথ্য',
			'    homepage.        notsynced': ' চিংক কৰা সম্ভৱ নহয় অনুগ্ৰহ কৰি ইণ্টাৰনেটলৈ সংযোগ কৰিবলৈ চেষ্টা কৰক আৰু পুনৰ চেষ্টা কৰক',
			'    homepage.        loadeddata': ' সফলতাৰে লোড কৰা তথ্য',
			'    homepage.        logoutwarning': ' আপুনি লগআউট কৰিব বিচাৰে বুলি নিশ্চিতনে?',
			'    homepage.        yes': ' হয়',
			'    homepage.        no': ' নহয়',
			'    homepage.        attention': ' মনোযোগ!',
			'    homepage.        syncdata': ' আপোনাক সফলতাৰে যোগ কৰা হৈছে ডাটা চিংক কৰিবলৈ পাহৰি নাযায়',
			'    studentmode.        studentmode': ' শিক্ষাৰ্থী মোড',
			'    studentmode.        selectdate': ' তাৰিখ বাছক',
			'    studentmode.        nocontent': ' কোনো আৱণ্টিত সমল পোৱা নগ\'ল',
			'    studentmode.        selectgat': ' আগলৈ আগবাঢ়িবলৈ এটা গাট বাছনি কৰক',
			'    studentmode.        videoname': ' ভিডিঅ\' নাম',
			'    studentmode.        gat': ' গাট',
			'    studentmode.        subject': ' বিষয়',
			'    studentmode.        topic': ' বিষয়',
			'    studentmode.        watch': ' ভিডিঅ\' চাওক',
			'    studentmode.        nocontentforgat': ' নিৰ্বাচিত গেটৰ বাবে কোনো আৱণ্টিত সমল পোৱা নগ\'ল অনুগ্ৰহ কৰি প্ৰথমে সমল আবণ্টন কৰক',
			'    studentmode.        deletecontent': ' আবন্টিত সমল এটা বিলোপ কৰক',
			'    studentmode.        deletewarning': ' আপুনি এই আৱণ্টিত সমল বিলোপ কৰিব বিচাৰে বুলি নিশ্চিতনে?',
			'    studentmode.        no': ' নহয়',
			'    studentmode.        yes': ' হয়',
			'    managestudents.        managestudents': '  শিক্ষাৰ্থীসকলক পৰিচালনা কৰক',
			'    managestudents.        search': ' অনুসন্ধান',
			'    managestudents.        notfound': ' কোনো ফলাফল পোৱা নগ\'ল',
			'    managestudents.        addnew': ' নতুন শিক্ষাৰ্থী যোগ কৰক',
			'    managestudents.        age': ' বয়স',
			'    managestudents.        cancel': ' বাতিল কৰা',
			'    managestudents.        submit': ' দাখিল কৰা',
			'    managestudents.        name': ' শিক্ষাৰ্থীৰ নাম',
			'    managestudents.        editstudent': ' শিক্ষাৰ্থীৰ বিৱৰণ সম্পাদনা কৰক',
			'    managestudents.        deletestudent': ' শিক্ষাৰ্থীৰ বিৱৰণ বিলোপ কৰক',
			'    managestudents.        deletestudentwarning': ' আপুনি এই শিশুটোৰ বাবে ৰেকৰ্ডবোৰ বিলোপ কৰিব বিচাৰে নেকি?',
			'    managestudents.        delete': ' মচি পেলাওক',
			'    managestudents.        gat': ' গাট',
			'    managestudents.        studentadded': ' শিক্ষাৰ্থীজনক সফলতাৰে যোগ কৰা হৈছে',
			'    allocatecontent.        allocatecontent': '   সমল আবন্টন কৰক',
			'    allocatecontent.        selectgat': ' গাট বাছক',
			'    allocatecontent.        selecttopic': ' বিষয় নিৰ্বাচন কৰক',
			'    allocatecontent.        selectvideos': ' ভিডিঅ\' বাছক',
			'    allocatecontent.        selectedvideos': ' নিৰ্বাচিত ভিডিঅ\'সমূহ',
			'    allocatecontent.        dateofcontent': ' অনুগ্ৰহ কৰি সমল আবন্টন কৰিবলৈ তাৰিখ এটা বাছনি কৰক',
			'    allocatecontent.        selectdate': ' তাৰিখ বাছক',
			'    takeattendance.        takeattendance': ' উপস্থিতি লওক',
			'    takeattendance.        date': ' তাৰিখ',
			'    takeattendance.        dashboard': ' ডেছবোৰ্ড',
			'    takeattendance.        selectgat': ' অনুগ্ৰহ কৰি এটা গাট বাছনি কৰক',
			'    takeattendance.        selectdate': ' তাৰিখ বাছক',
			'    takeattendance.        save': ' সংৰক্ষণ কৰক',
			'    takeattendance.        attendancenottaken': ' উপস্থিতি লোৱা হোৱা নাই',
			'    takeattendance.        nostudent': ' এই গাটৰ বাবে কোনো শিক্ষাৰ্থী পঞ্জীয়ন কৰা হোৱা নাই!',
			'    takeattendance.        holiday': ' আজি হলিডে',
			'    takeattendance.confirmattendance': 'উপস্থিতি নিশ্চিত কৰক',
			'    takeattendance.confirmwarning': 'অনুগ্ৰহ কৰি নিশ্চিত কৰক যে আপুনি এই উপস্থিতি দাখিল কৰিব বিচাৰে',
			'    takeattendance.cancel': 'বাতিল কৰা',
			'    takeattendance.ok': 'হ\'ব',
			'    takeattendance.attendancetaken': 'ইতিমধ্যে লোৱা উপস্থিতি',
			'    takeattendance.takenwarning': 'আপুনি ইতিমধ্যে সেই গাটৰ বাবে উপস্থিতি লৈছে',
			'    review.        review': '    পৰ্যালোচনা',
			'    review.        selectmonth': ' মাহ নিৰ্বাচন কৰক',
			'    review.        selectgat': ' অনুগ্ৰহ কৰি এটা গাট বাছনি কৰক',
			'    review.        attendancereview': ' উপস্থিতি পৰ্যালোচনা',
			'    review.        quizreview': ' কুইজ পৰ্যালোচনা',
			'    review.        videoprog': ' ভিডিঅ\' প্ৰগতি',
			'    review.        selectstudent': ' অনুগ্ৰহ কৰি এজন শিক্ষাৰ্থী বাছনি কৰক',
			'    review.        nodata': ' নিৰ্বাচিত ক্ষেত্ৰসমূহৰ বাবে দেখুৱাবলৈ কোনো ডাটা নাই',
			'    review.        noquizgiven': ' কোনো কুইজ দিয়া হোৱা নাই',
			'    review.        videono': ' ভিডিঅ\' নম্বৰ',
			'    review.        topic': ' বিষয়',
			'    review.        duration': ' সময়কাল',
			'    review.        progress': ' প্ৰগতি',
			'    review.        noattendance': ' উপস্থিতি লোৱা হোৱা নাই',
			'    assessment.        createquiz': '      কুইজ সৃষ্টি কৰক',
			'    assessment.        createqs': '     প্ৰশ্ন সৃষ্টি কৰক',
			'    assessment.        createqzs': ' কুইজ সৃষ্টি কৰক',
			'    assessment.        allqzs': ' সকলো কুইজ',
			'    assessment.        giveqz': ' কুইজ দিয়ক',
			'    assessment.        selectgat': ' গাট বাছক',
			'    assessment.        selecttopic': ' বিষয় নিৰ্বাচন কৰক',
			'    assessment.        enterq': ' প্ৰশ্ন প্ৰবিষ্ট কৰক',
			'    assessment.        enteroptiona': ' বিকল্প এ প্ৰবিষ্ট কৰক',
			'    assessment.        enteroptionb': ' বিকল্প বি প্ৰবিষ্ট কৰক',
			'    assessment.        enteroptionc': ' বিকল্প চি প্ৰবিষ্ট কৰক',
			'    assessment.        enteroptiond': ' বিকল্প ডি প্ৰবিষ্ট কৰক',
			'    assessment.        choosea': ' উত্তৰ বাছক',
			'    assessment.        optiona': ' বিকল্প এ',
			'    assessment.        optionb': ' বিকল্প বি',
			'    assessment.        optionc': ' বিকল্প চি',
			'    assessment.        optiond': ' বিকল্প ঘ ',
			'    assessment.        selectqs': '    প্ৰশ্নসমূহ বাছনি কৰক   ',
			'    assessment.        selectatleastoneq': ' অনুগ্ৰহ কৰি কমেও এটা প্ৰশ্ন বাছনি কৰক',
			'    assessment.        noqs': ' প্ৰদৰ্শন কৰিবলৈ কোনো প্ৰশ্ন নাই',
			'    assessment.        makequizwarning': ' আপুনি বাছনি কৰা প্ৰশ্নবোৰৰ পৰা এটা কুইজ বনাব বিচাৰে বুলি নিশ্চিতনে?',
			'    assessment.        selectdate': ' তাৰিখ বাছক',
			'    assessment.        qztime': ' মুঠ কুইজ সময়',
			'    assessment.        cancel': ' বাতিল কৰা',
			'    assessment.        qzcreated': ' কুইজটো সফলতাৰে সৃষ্টি কৰা হৈছে',
			'    assessment.        noqzs': ' দেখুৱাবলৈ কোনো কুইজ নাই!!',
			'    assessment.        selectqz': ' এটা কুইজ বাছনি কৰক',
			'    assessment.        listogqzs': ' সকলো কুইজৰ তালিকা',
			'    assessment.        noqzsmade': ' এতিয়ালৈকে কোনো কুইজ বনোৱা হোৱা নাই',
			'    assessment.        gat': ' গাট ',
			'    assessment.        date': 'তাৰিখ ',
			'    assessment.        deleteqzs': ' কুইজ এটা বিলোপ কৰক',
			'    assessment.        deleteqzwarning': ' আপুনি এই আৱণ্টিত কুইজটো বিলোপ কৰিব বিচাৰে বুলি নিশ্চিতনে?',
			'    assessment.ok': 'হ\'ব',
		};
	}
}

extension on _StringsBn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': ' ছাত্র মোড',
			'    homepage.        takeattendance': ' উপস্থিতি নিন',
			'    homepage.        allocatecontent': ' বিষয়বস্তু বরাদ্দ করুন',
			'    homepage.        review': ' পর্যালোচনা',
			'    homepage.        managestudent': ' ছাত্র পরিচালনা করুন',
			'    homepage.        logout': ' লগ আউট করুন',
			'    homepage.        assessment': ' মূল্যায়ন',
			'    homepage.        loadsampledata': ' ডাটা লোড করুন',
			'    homepage.        ekal': ' একল আচার্য',
			'    homepage.        synced': ' তথ্য সফলভাবে সার্ভারে পাঠানো হয়েছে',
			'    homepage.        notsynced': ' সিঙ্ক করা সম্ভব নয় অনুগ্রহ করে ইন্টারনেটে সংযোগ করার চেষ্টা করুন এবং আবার চেষ্টা করুন',
			'    homepage.        loadeddata': ' সফলভাবে লোড করা তথ্য',
			'    homepage.        logoutwarning': ' আপনি কি নিশ্চিত যে আপনি লগআউট করতে চান?',
			'    homepage.        yes': ' হ্যাঁ',
			'    homepage.        no': ' না',
			'    homepage.        attention': ' সাবধান!',
			'    homepage.        syncdata': ' আপনি সফলভাবে ডেটা যোগ করেছেন ডেটা সিঙ্ক করতে ভুলবেন না',
			'    studentmode.        studentmode': ' ছাত্র মোড',
			'    studentmode.        selectdate': ' তারিখ নির্বাচন করুন',
			'    studentmode.        nocontent': ' কোনও বরাদ্দকৃত সামগ্রী খুঁজে পাওয়া যায়নি',
			'    studentmode.        selectgat': ' আরও এগিয়ে যেতে একটি গ্যাট নির্বাচন করুন',
			'    studentmode.        videoname': ' ভিডিওর নাম',
			'    studentmode.        gat': ' গ্যাট',
			'    studentmode.        subject': ' বিষয়শ্রেণী',
			'    studentmode.        topic': ' বিষয়',
			'    studentmode.        watch': ' ভিডিও দেখুন',
			'    studentmode.        nocontentforgat': ' নির্বাচিত গ্যাটের জন্য কোনও বরাদ্দকৃত সামগ্রী পাওয়া যায়নি দয়া করে প্রথমে সামগ্রী বরাদ্দ করুন',
			'    studentmode.        deletecontent': ' একটি বরাদ্দকৃত সামগ্রী মুছুন',
			'    studentmode.        deletewarning': ' আপনি কি নিশ্চিত যে আপনি এই বরাদ্দকৃত সামগ্রীটি বিলোপ করতে চান?',
			'    studentmode.        no': ' না',
			'    studentmode.        yes': ' হ্যাঁ',
			'    managestudents.        managestudents': ' শিক্ষার্থীদের পরিচালনা করুন',
			'    managestudents.        search': ' সন্ধান',
			'    managestudents.        notfound': ' কোনও ফলাফল খুঁজে পাওয়া যায়নি',
			'    managestudents.        addnew': ' নতুন ছাত্র যোগ করুন',
			'    managestudents.        age': ' বয়স',
			'    managestudents.        cancel': ' বাতিল',
			'    managestudents.        submit': ' জমা',
			'    managestudents.        name': ' ছাত্রের নাম',
			'    managestudents.        editstudent': ' শিক্ষার্থীর বিবরণ সম্পাদনা করুন',
			'    managestudents.        deletestudent': ' শিক্ষার্থীর বিবরণ মুছুন',
			'    managestudents.        deletestudentwarning': ' আপনি কি এই সন্তানের জন্য রেকর্ডগুলি মুছতে চান?',
			'    managestudents.        delete': ' বিলোপ',
			'    managestudents.        gat': ' গ্যাট',
			'    managestudents.        studentadded': ' ছাত্রটি সফলভাবে যোগ করা হয়েছে',
			'    allocatecontent.        allocatecontent': ' বিষয়বস্তু বরাদ্দ করুন',
			'    allocatecontent.        selectgat': ' গ্যাট নির্বাচন করুন',
			'    allocatecontent.        selecttopic': ' বিষয় নির্বাচন করুন',
			'    allocatecontent.        selectvideos': ' ভিডিওগুলি নির্বাচন করুন',
			'    allocatecontent.        selectedvideos': ' নির্বাচিত ভিডিওসমূহ',
			'    allocatecontent.        dateofcontent': ' অনুগ্রহ করে বিষয়বস্তু বরাদ্দ করার জন্য একটি তারিখ নির্বাচন করুন',
			'    allocatecontent.        selectdate': ' তারিখ নির্বাচন করুন',
			'    takeattendance.        takeattendance': ' উপস্থিতি নিন',
			'    takeattendance.        date': ' তারিখ',
			'    takeattendance.        dashboard': ' ড্যাশবোর্ড',
			'    takeattendance.        selectgat': ' অনুগ্রহ করে একটি গ্যাট নির্বাচন করুন',
			'    takeattendance.        selectdate': ' তারিখ নির্বাচন করুন',
			'    takeattendance.        save': ' সংরক্ষণ',
			'    takeattendance.        attendancenottaken': ' উপস্থিতি নেওয়া হয়নি',
			'    takeattendance.        nostudent': ' কোনও শিক্ষার্থী এই গ্যাটের জন্য নিবন্ধিত নয়!',
			'    takeattendance.        holiday': ' আজ ছুটির দিন',
			'    takeattendance.confirmattendance': 'উপস্থিতি নিশ্চিত করুন',
			'    takeattendance.confirmwarning': 'অনুগ্রহ করে নিশ্চিত করুন যে আপনি এই উপস্থিতি জমা দিতে চান',
			'    takeattendance.cancel': 'বাতিল',
			'    takeattendance.ok': 'ঠিক আছে',
			'    takeattendance.attendancetaken': 'উপস্থিতি ইতিমধ্যে গৃহীত হয়েছে',
			'    takeattendance.takenwarning': 'আপনি ইতিমধ্যে আজ সেই গ্যাটের জন্য উপস্থিতি গ্রহণ করেছেন',
			'    review.        review': '  পর্যালোচনা',
			'    review.        selectmonth': ' মাস নির্বাচন করুন',
			'    review.        selectgat': ' অনুগ্রহ করে একটি গ্যাট নির্বাচন করুন',
			'    review.        attendancereview': ' উপস্থিতি পর্যালোচনা',
			'    review.        quizreview': ' কুইজ পর্যালোচনা',
			'    review.        videoprog': ' ভিডিও প্রগতি',
			'    review.        selectstudent': ' অনুগ্রহ করে একজন ছাত্র নির্বাচন করুন',
			'    review.        nodata': ' নির্বাচিত ক্ষেত্রগুলির জন্য দেখানোর জন্য কোনও তথ্য নেই',
			'    review.        noquizgiven': ' কোনও ক্যুইজ দেওয়া হয়নি',
			'    review.        videono': ' ভিডিও নং।',
			'    review.        topic': ' বিষয়',
			'    review.        duration': ' স্থিতিকাল',
			'    review.        progress': ' প্রগতি',
			'    review.        noattendance': ' উপস্থিতি নেওয়া হয়নি',
			'    assessment.        createquiz': ' কুইজ তৈরি করুন',
			'    assessment.        createqs': ' প্রশ্ন তৈরি করুন',
			'    assessment.        createqzs': ' ক্যুইজগুলি তৈরি করুন',
			'    assessment.        allqzs': ' সকল ক্যুইজ',
			'    assessment.        giveqz': ' কুইজ দিন',
			'    assessment.        selectgat': ' গ্যাট নির্বাচন করুন',
			'    assessment.        selecttopic': ' বিষয় নির্বাচন করুন',
			'    assessment.        enterq': ' প্রশ্ন লিখুন',
			'    assessment.        enteroptiona': ' বিকল্প A লিখুন',
			'    assessment.        enteroptionb': ' বিকল্প B লিখুন',
			'    assessment.        enteroptionc': ' বিকল্প C লিখুন',
			'    assessment.        enteroptiond': ' বিকল্প D লিখুন',
			'    assessment.        choosea': ' উত্তর চয়ন করুন',
			'    assessment.        optiona': ' বিকল্প A',
			'    assessment.        optionb': ' বিকল্প B',
			'    assessment.        optionc': ' বিকল্প C',
			'    assessment.        optiond': ' বিকল্প D ',
			'    assessment.        selectqs': '     প্রশ্ননির্বাচন করুন   ',
			'    assessment.        selectatleastoneq': ' অনুগ্রহ করে কমপক্ষে একটি প্রশ্ন নির্বাচন করুন',
			'    assessment.        noqs': ' প্রদর্শনের জন্য কোন প্রশ্ন নেই',
			'    assessment.        makequizwarning': ' আপনি কি নিশ্চিত যে আপনি নির্বাচিত প্রশ্নগুলি থেকে একটি কুইজ তৈরি করতে চান?',
			'    assessment.        selectdate': ' তারিখ নির্বাচন করুন',
			'    assessment.        qztime': ' মোট কুইজ সময়',
			'    assessment.        cancel': ' বাতিল',
			'    assessment.        qzcreated': ' কুইজটি সফলভাবে তৈরি করা হয়েছে',
			'    assessment.        noqzs': ' দেখানোর জন্য কোনও ক্যুইজ নেই !!',
			'    assessment.        selectqz': ' একটি কুইজ নির্বাচন করুন',
			'    assessment.        listogqzs': ' সকল ক্যুইজের তালিকা',
			'    assessment.        noqzsmade': ' এখনও কোনও ক্যুইজ তৈরি করা হয়নি',
			'    assessment.        gat': ' গ্যাট ',
			'    assessment.        date': 'তারিখ ',
			'    assessment.        deleteqzs': ' একটি কুইজ মুছুন',
			'    assessment.        deleteqzwarning': ' তুমি কি নিশ্চিত যে তুমি এই বরাদ্দকৃত ক্যুইজটি মুছতে চাও?',
			'    assessment.ok': 'ঠিক আছে',
		};
	}
}

extension on _StringsGu {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': ' વિદ્યાર્થી સ્થિતિ',
			'    homepage.        takeattendance': ' હાજરી લો',
			'    homepage.        allocatecontent': ' સમાવિષ્ટ ફાળવો',
			'    homepage.        review': ' રીવ્યુ',
			'    homepage.        managestudent': ' વિદ્યાર્થીનું સંચાલન કરો',
			'    homepage.        logout': ' બહાર નીકળો',
			'    homepage.        assessment': ' આકારણી',
			'    homepage.        loadsampledata': ' માહિતી લાવો',
			'    homepage.        ekal': ' એકલ આચાર્ય',
			'    homepage.        synced': ' માહિતી સફળતાપૂર્વક સર્વર પર મોકલેલ છે',
			'    homepage.        notsynced': ' સિંક કરવાનું શક્ય નથી કૃપા કરીને ઇન્ટરનેટ સાથે જોડાવાનો પ્રયાસ કરો અને ફરીથી પ્રયત્ન કરો',
			'    homepage.        loadeddata': ' લોડ થયેલ માહિતી સફળતાપૂર્વક',
			'    homepage.        logoutwarning': ' શું તમે ખરેખર બહાર નીકળવા માંગો છો?',
			'    homepage.        yes': ' હા',
			'    homepage.        no': ' ના',
			'    homepage.        attention': ' ધ્યાન!',
			'    homepage.        syncdata': ' તમે સફળતાપૂર્વક ઉમેરાયેલ છે ડેટા સિંક કરવાનું ભૂલશો નહિં',
			'    studentmode.        studentmode': ' વિદ્યાર્થી સ્થિતિ',
			'    studentmode.        selectdate': ' તારીખ પસંદ કરો',
			'    studentmode.        nocontent': ' ફાળવેલ સમાવિષ્ટ મળ્યુ નથી',
			'    studentmode.        selectgat': ' આગળ વધવા માટે Gat પસંદ કરો',
			'    studentmode.        videoname': ' વિડિઓ નામ',
			'    studentmode.        gat': ' ગાટ',
			'    studentmode.        subject': ' વિષય',
			'    studentmode.        topic': ' વિષય',
			'    studentmode.        watch': ' જુઓ વીડિયો',
			'    studentmode.        nocontentforgat': ' પસંદ કરેલ ગેટ માટે કોઈ ફાળવેલ સામગ્રી મળી નથી કૃપા કરીને પહેલા સામગ્રી ફાળવો',
			'    studentmode.        deletecontent': ' ફાળવેલ સામગ્રીને કાઢી નાંખો',
			'    studentmode.        deletewarning': ' શું તમને ખાત્રી છે કે તમે આ ફાળવેલી સામગ્રીને ડીલીટ કરવા માગો છો?',
			'    studentmode.        no': ' ના',
			'    studentmode.        yes': ' હા',
			'    managestudents.        managestudents': ' વિદ્યાર્થીઓને મેનેજ કરો',
			'    managestudents.        search': ' શોધવું',
			'    managestudents.        notfound': ' પરિણામો મળ્યાં નથી',
			'    managestudents.        addnew': ' નવો વિદ્યાર્થી ઉમેરો',
			'    managestudents.        age': ' ઉમર',
			'    managestudents.        cancel': ' રદ્દ',
			'    managestudents.        submit': ' મોકલો',
			'    managestudents.        name': ' વિદ્યાર્થીનું નામ',
			'    managestudents.        editstudent': ' વિદ્યાર્થી વિગતોમાં ફેરફાર કરો',
			'    managestudents.        deletestudent': ' વિદ્યાર્થી વિગતો કાઢી નાંખો',
			'    managestudents.        deletestudentwarning': ' શું તમે આ બાળક માટેના રેકોર્ડ્સ કાઢી નાખવા માંગો છો?',
			'    managestudents.        delete': ' કાઢી નાંખો',
			'    managestudents.        gat': ' ગાટ',
			'    managestudents.        studentadded': ' વિદ્યાર્થીને સફળતાપૂર્વક ઉમેરવામાં આવ્યો છે',
			'    allocatecontent.        allocatecontent': ' સમાવિષ્ટ ફાળવો',
			'    allocatecontent.        selectgat': ' ગેટ પસંદ કરો',
			'    allocatecontent.        selecttopic': ' મુદ્દો પસંદ કરો',
			'    allocatecontent.        selectvideos': ' વિડિયો પસંદ કરો',
			'    allocatecontent.        selectedvideos': ' પસંદ થયેલ વિડિયો',
			'    allocatecontent.        dateofcontent': ' કૃપા કરીને સામગ્રી ફાળવવા માટે તારીખ પસંદ કરો',
			'    allocatecontent.        selectdate': ' તારીખ પસંદ કરો',
			'    takeattendance.        takeattendance': '  હાજરી લો',
			'    takeattendance.        date': ' તિથિ',
			'    takeattendance.        dashboard': ' ડેશબોર્ડ',
			'    takeattendance.        selectgat': ' કૃપા કરીને ગેટ પસંદ કરો',
			'    takeattendance.        selectdate': ' તારીખ પસંદ કરો',
			'    takeattendance.        save': ' સંગ્રહો',
			'    takeattendance.        attendancenottaken': ' હાજરી લેવાઈ નથી',
			'    takeattendance.        nostudent': ' આ ગેટ માટે કોઈ વિદ્યાર્થી રજીસ્ટર્ડ નથી!',
			'    takeattendance.        holiday': ' આજે રજા છે',
			'    takeattendance.confirmattendance': 'હાજરીની ખાતરી કરો',
			'    takeattendance.confirmwarning': 'કૃપા કરીને પુષ્ટિ કરો કે તમે આ હાજરી સબમિટ કરવા માંગો છો',
			'    takeattendance.cancel': 'રદ્દ',
			'    takeattendance.ok': 'બરાબર',
			'    takeattendance.attendancetaken': 'હાજરી પહેલેથી જ લીધેલ છે',
			'    takeattendance.takenwarning': 'તમે આજે તે ગેટ માટે હાજરી પહેલેથી જ લઈ લીધી છે',
			'    review.        review': '  રીવ્યુ',
			'    review.        selectmonth': ' મહિનો પસંદ કરો',
			'    review.        selectgat': ' કૃપા કરીને ગેટ પસંદ કરો',
			'    review.        attendancereview': ' હાજરી સમીક્ષા',
			'    review.        quizreview': ' ક્વિઝ સમીક્ષા',
			'    review.        videoprog': ' વિડિયો પ્રગતિ',
			'    review.        selectstudent': ' કૃપા કરીને કોઈ વિદ્યાર્થીને પસંદ કરો',
			'    review.        nodata': ' પસંદ કરેલ ક્ષેત્રો માટે બતાવવા માટે માહિતી નથી',
			'    review.        noquizgiven': ' કોઈ ક્વિઝ આપેલ નથી',
			'    review.        videono': ' વીડિયો નં.',
			'    review.        topic': ' વિષય',
			'    review.        duration': ' સમયગાળો',
			'    review.        progress': ' પ્રગતિ',
			'    review.        noattendance': ' હાજરી લીધેલ નથી',
			'    assessment.        createquiz': ' ક્વિઝ બનાવો',
			'    assessment.        createqs': ' પ્રશ્નો બનાવો',
			'    assessment.        createqzs': ' ક્વિઝ બનાવો',
			'    assessment.        allqzs': ' બધી ક્વિઝ',
			'    assessment.        giveqz': ' ક્વિઝ આપો',
			'    assessment.        selectgat': ' Gat ને પસંદ કરો',
			'    assessment.        selecttopic': ' મુદ્દો પસંદ કરો',
			'    assessment.        enterq': ' પ્રશ્ન દાખલ કરો',
			'    assessment.        enteroptiona': ' વિકલ્પ A દાખલ કરો',
			'    assessment.        enteroptionb': ' વિકલ્પ બી દાખલ કરો',
			'    assessment.        enteroptionc': ' વિકલ્પ C દાખલ કરો',
			'    assessment.        enteroptiond': ' વિકલ્પ D દાખલ કરો',
			'    assessment.        choosea': ' જવાબ પસંદ કરો',
			'    assessment.        optiona': ' વિકલ્પ A',
			'    assessment.        optionb': ' વિકલ્પ B',
			'    assessment.        optionc': ' વિકલ્પ C',
			'    assessment.        optiond': ' વિકલ્પ D ',
			'    assessment.        selectqs': '    પ્રશ્નો પસંદ કરો',
			'    assessment.        selectatleastoneq': ' કૃપા કરીને ઓછામાં ઓછો એક પ્રશ્ન પસંદ કરો',
			'    assessment.        noqs': ' દર્શાવવા માટે કોઈ પ્રશ્નો નથી',
			'    assessment.        makequizwarning': ' શું તમને ખાત્રી છે કે તમે પસંદ કરેલા પ્રશ્નોમાંથી ક્વિઝ બનાવવા માગો છો?',
			'    assessment.        selectdate': ' તારીખ પસંદ કરો',
			'    assessment.        qztime': ' કુલ ક્વિઝ સમય',
			'    assessment.        cancel': ' રદ્દ',
			'    assessment.        qzcreated': ' ક્વિઝ સફળતાપૂર્વક બનાવવામાં આવી છે',
			'    assessment.        noqzs': ' !! બતાવવા માટે કોઈ ક્વિઝ નથી',
			'    assessment.        selectqz': ' ક્વિઝ પસંદ કરો',
			'    assessment.        listogqzs': ' બધી ક્વિઝની યાદી',
			'    assessment.        noqzsmade': ' હજી સુધી કોઈ ક્વિઝ બનાવવામાં આવી નથી',
			'    assessment.        gat': ' ગાટ ',
			'    assessment.        date': 'તિથિ ',
			'    assessment.        deleteqzs': ' ક્વિઝ કાઢી નાંખો',
			'    assessment.        deleteqzwarning': ' શું તમે ખરેખર આ ફાળવેલ ક્વિઝને ડિલીટ કરવા માગો છો?',
			'    assessment.ok': 'બરાબર',
		};
	}
}

extension on _StringsHi {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'homepage.studentmode': 'छात्र मोड',
			'homepage.takeattendance': 'उपस्थिति लेना',
			'homepage.allocatecontent': 'सामग्री आबंटित \nकरना',
			'homepage.review': 'समीक्षा',
			'homepage.managestudent': 'प्रबंधित\nछात्र',
			'homepage.logout': 'लॉग आउट',
			'homepage.assessment': 'मूल्यांकन',
			'homepage.loadsampledata': 'डेटा प्राप्त करना',
			'homepage.ekal': 'एकल आचार्य',
			'homepage.synced': 'सर्वर पर सफलतापूर्वक भेजा गया डेटा',
			'homepage.notsynced': 'सिंक्रनाइज़ेशन संभव नहीं था कृपया इंटरनेट से कनेक्ट होने का प्रयास करें और पुन: प्रयास करें',
			'homepage.loadeddata': 'लोड किया गया डेटा सफलतापूर्वक',
			'homepage.logoutwarning': 'क्या आप वाकई लॉगआउट करना चाहते हैं?',
			'homepage.yes': 'हाँ',
			'homepage.no': 'नहीं',
			'homepage.attention': 'ध्यान!',
			'homepage.syncdata': 'आपने सफलतापूर्वक डेटा जोड़ा है. डेटा सिंक्रनाइज़ करना न भूलें',
			'studentmode.studentmode': 'छात्र मोड',
			'studentmode.selectdate': 'दिनांक का चयन करें:   ',
			'studentmode.nocontent': 'कोई आबंटित सामग्री नहीं मिली',
			'studentmode.selectgat': 'आगे बढ़ने के लिए एक गैट का चयन करें:',
			'studentmode.videoname': 'वीडियो का नाम',
			'studentmode.gat': 'गट',
			'studentmode.subject': 'विषय',
			'studentmode.topic': 'उपविषय',
			'studentmode.watch': 'वीडियो देखें',
			'studentmode.nocontentforgat': 'चयनित गट के लिए कोई आबंटित सामग्री नहीं मिली\n\nकृपया पहले सामग्री आबंटित करें',
			'studentmode.deletecontent': 'आबंटित सामग्री हटाएँ',
			'studentmode.deletewarning': 'क्या आप वाकई इस आबंटित सामग्री को हटाना चाहते हैं ?',
			'studentmode.no': 'नहीं',
			'studentmode.yes': 'हाँ',
			'managestudents.managestudents': 'प्रबंधित छात्र',
			'managestudents.search': 'खोजें',
			'managestudents.notfound': 'कोई परिणाम नहीं मिला',
			'managestudents.addnew': 'नया छात्र जोड़ें',
			'managestudents.age': 'उम्र: ',
			'managestudents.cancel': 'रद्द',
			'managestudents.submit': 'सबमिट',
			'managestudents.name': 'छात्र का नाम',
			'managestudents.editstudent': 'छात्र विवरण संपादित करें',
			'managestudents.deletestudent': 'छात्र विवरण हटाएँ',
			'managestudents.deletestudentwarning': 'क्या आप इस बच्चे के लिए रिकॉर्ड हटाना चाहते हैं?',
			'managestudents.delete': 'हटाएँ',
			'managestudents.gat': 'गट: ',
			'managestudents.studentadded': 'छात्र को सफलतापूर्वक जोड़ा गया है',
			'allocatecontent.allocatecontent': 'सामग्री आबंटित करना',
			'allocatecontent.selectgat': 'गट चयन करें',
			'allocatecontent.selecttopic': 'विषय का चयन',
			'allocatecontent.selectvideos': 'वीडियो का चयन',
			'allocatecontent.selectedvideos': 'चयनित वीडियो',
			'allocatecontent.dateofcontent': 'कृपया सामग्री आबंटित करने के लिए किसी दिनांक का चयन करें',
			'allocatecontent.selectdate': 'दिनांक का चयन करें:   ',
			'takeattendance.takeattendance': 'उपस्थिति लेना',
			'takeattendance.date': 'दिनांक:  ',
			'takeattendance.dashboard': 'डैशबोर्ड',
			'takeattendance.selectgat': 'गट चयन करें',
			'takeattendance.selectdate': 'दिनांक का चयन करें:',
			'takeattendance.save': 'सहेजें',
			'takeattendance.attendancenottaken': 'उपस्थिति नहीं ली गई',
			'takeattendance.nostudent': 'कोई भी छात्र इस गैट के लिए पंजीकृत नहीं है!',
			'takeattendance.holiday': 'आज छुट्टी है',
			'takeattendance.confirmattendance': 'उपस्थिति की पुष्टि करें',
			'takeattendance.confirmwarning': 'कृपया पुष्टि करें कि आप इस उपस्थिति को सबमिट करना चाहते हैं',
			'takeattendance.cancel': 'रद्द',
			'takeattendance.ok': 'ठीक है',
			'takeattendance.attendancetaken': 'उपस्थिति पहले से ही ली गई है',
			'takeattendance.takenwarning': 'आप पहले से ही है कि gat के लिए उपस्थिति ले लिया है आज',
			'review.review': 'समीक्षा',
			'review.selectmonth': 'महीने का चयन करें: ',
			'review.selectgat': 'गट चयन करें',
			'review.attendancereview': 'उपस्थिति समीक्षा',
			'review.quizreview': 'प्रश्नोत्तरी समीक्षा',
			'review.videoprog': 'वीडियो प्रगति',
			'review.selectstudent': 'कृपया एक छात्र का चयन करें',
			'review.nodata': 'चयनित फ़ील्ड्स के लिए दिखाने के लिए कोई डेटा नहीं',
			'review.noquizgiven': 'No Quizzes Given',
			'review.videono': 'वीडियो नंबर ',
			'review.topic': 'विषय',
			'review.duration': 'अवधि',
			'review.progress': 'प्रगति',
			'review.noattendance': 'उपस्थिति नहीं ली गई ',
			'assessment.createquiz': 'प्रश्नोत्तरी बनाएँ',
			'assessment.createqs': 'प्रश्न बनाएँ',
			'assessment.createqzs': 'परीक्षा बनाएँ',
			'assessment.allqzs': 'सभी प्रश्नोत्तरी',
			'assessment.giveqz': 'प्रश्नोत्तरी दें',
			'assessment.selectgat': 'गट चयन करें:  ',
			'assessment.selecttopic': 'विषय का चयन:  ',
			'assessment.enterq': 'प्रश्न दर्ज करें',
			'assessment.enteroptiona': 'विकल्प A दर्ज करें',
			'assessment.enteroptionb': 'विकल्प B दर्ज करें',
			'assessment.enteroptionc': 'विकल्प C दर्ज करें',
			'assessment.enteroptiond': 'विकल्प D दर्ज करें',
			'assessment.choosea': 'उत्तर चुनें',
			'assessment.optiona': 'विकल्प A',
			'assessment.optionb': 'विकल्प B',
			'assessment.optionc': 'विकल्प C',
			'assessment.optiond': 'विकल्प D',
			'assessment.selectqs': '   प्रश्नों का चयन करें   ',
			'assessment.selectatleastoneq': 'कृपया कम से कम एक प्रश्न का चयन करें',
			'assessment.noqs': 'प्रदर्शित करने के लिए कोई प्रश्न नहीं',
			'assessment.makequizwarning': 'क्या आप वाकई चयनित प्रश्नों में से एक प्रश्नोत्तरी बनाना चाहते हैं?',
			'assessment.selectdate': 'दिनांक का चयन करें:   ',
			'assessment.qztime': 'कुल प्रश्नोत्तरी समय:   ',
			'assessment.cancel': 'रद्द',
			'assessment.qzcreated': 'प्रश्नोत्तरी सफलतापूर्वक बनाया गया है',
			'assessment.noqzs': 'कोई प्रश्नोत्तरी नहीं !!',
			'assessment.selectqz': 'किसी प्रश्नोत्तरी का चयन करें',
			'assessment.listogqzs': 'सभी प्रश्नोत्तरी की सूची',
			'assessment.noqzsmade': 'प्रश्नोत्तरी अभी तक नहीं बनाया गया है',
			'assessment.gat': 'गट : ',
			'assessment.date': 'दिनांक :  ',
			'assessment.deleteqzs': 'क्विज़ हटाएँ',
			'assessment.deleteqzwarning': 'क्या आप वाकई इस आबंटित प्रश्नोत्तरी को हटाना चाहते हैं ?',
			'assessment.ok': 'ठीक है',
		};
	}
}

extension on _StringsKn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': ' ವಿದ್ಯಾರ್ಥಿ ಮೋಡ್',
			'    homepage.        takeattendance': ' ಹಾಜರಾತಿಯನ್ನು ತೆಗೆದುಕೊಳ್ಳಿ',
			'    homepage.        allocatecontent': ' ವಿಷಯವನ್ನು ಹಂಚಿಕೆ ಮಾಡಿ',
			'    homepage.        review': ' ವಿಮರ್ಶೆ',
			'    homepage.        managestudent': ' ವಿದ್ಯಾರ್ಥಿಯನ್ನು ನಿರ್ವಹಿಸಿ',
			'    homepage.        logout': ' ಲಾಗ್ ಔಟ್',
			'    homepage.        assessment': ' ಮೌಲ್ಯಮಾಪನ',
			'    homepage.        loadsampledata': ' ಡೇಟಾ ಲೋಡ್ ಮಾಡಿ',
			'    homepage.        ekal': ' ಏಕಲ್ ಆಚಾರ್ಯ',
			'    homepage.        synced': ' ಸರ್ವರ್ ಗೆ ಡೇಟಾವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕಳುಹಿಸಲಾಗಿದೆ',
			'    homepage.        notsynced': ' ಸಿಂಕ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ ದಯವಿಟ್ಟು ಇಂಟರ್ನೆಟ್ ಗೆ ಸಂಪರ್ಕಿಸಲು ಪ್ರಯತ್ನಿಸಿ ಮತ್ತು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ',
			'    homepage.        loadeddata': ' ಲೋಡ್ ಮಾಡಿದ ಡೇಟಾ ಯಶಸ್ವಿಯಾಗಿ',
			'    homepage.        logoutwarning': ' ನೀವು ನಿಶ್ಚಯವಾಗಿ ನಿರ್ಗಮಿಸಲು ಬಯಸುವಿರಾ?',
			'    homepage.        yes': ' ಹೌದು',
			'    homepage.        no': ' ಇಲ್ಲ',
			'    homepage.        attention': ' ಗಮನ ಹರಿಸಿ!',
			'    homepage.        syncdata': ' ನೀವು ಯಶಸ್ವಿಯಾಗಿ ಸೇರಿಸಲ್ಪಟ್ಟಿದ್ದೀರಿ ಡೇಟಾ ಸಿಂಕ್ ಮಾಡಲು ಮರೆತಿಲ್ಲ ಡೇಟಾ',
			'    studentmode.        studentmode': ' ವಿದ್ಯಾರ್ಥಿ ಮೋಡ್',
			'    studentmode.        selectdate': ' ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ',
			'    studentmode.        nocontent': ' ಯಾವುದೇ ಹಂಚಿಕೆಯಾದ ವಿಷಯ ಸಿಗಲಿಲ್ಲ',
			'    studentmode.        selectgat': ' ಮುಂದೆ ಸಾಗಲು ಒಂದು Gat ಅನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'    studentmode.        videoname': ' ವೀಡಿಯೊ ಹೆಸರು',
			'    studentmode.        gat': ' ಗ್ಯಾಟ್',
			'    studentmode.        subject': ' ವಿಷಯ',
			'    studentmode.        topic': ' ವಿಷಯ',
			'    studentmode.        watch': ' ವೀಡಿಯೊ ವೀಕ್ಷಿಸಿ',
			'    studentmode.        nocontentforgat': ' ಆಯ್ಕೆಮಾಡಿದ ಘಾಟ್ ಗೆ ಯಾವುದೇ ಹಂಚಿಕೆಯಾದ ವಿಷಯ ಕಂಡುಬಂದಿಲ್ಲ ದಯವಿಟ್ಟು ಮೊದಲು ವಿಷಯವನ್ನು ಹಂಚಿಕೆ ಮಾಡಿ',
			'    studentmode.        deletecontent': ' ಹಂಚಿಕೆಯಾದ ವಿಷಯವನ್ನು ಅಳಿಸು',
			'    studentmode.        deletewarning': ' ಈ ಹಂಚಿಕೆಯಾದ ವಿಷಯವನ್ನು ನೀವು ಅಳಿಸಬೇಕೆಂದಿರುವುದು ಖಚಿತವೆ?',
			'    studentmode.        no': ' ಇಲ್ಲ',
			'    studentmode.        yes': ' ಹೌದು',
			'    managestudents.        managestudents': ' ವಿದ್ಯಾರ್ಥಿಗಳನ್ನು ನಿರ್ವಹಿಸಿ',
			'    managestudents.        search': ' ಶೋಧಿಸು',
			'    managestudents.        notfound': ' ಯಾವುದೇ ಫಲಿತಾಂಶಗಳು ಸಿಗಲಿಲ್ಲ',
			'    managestudents.        addnew': ' ಹೊಸ ವಿದ್ಯಾರ್ಥಿಯನ್ನು ಸೇರಿಸಿ',
			'    managestudents.        age': ' ವಯಸ್ಸು',
			'    managestudents.        cancel': ' ರದ್ದುಮಾಡಿ',
			'    managestudents.        submit': ' ಸಲ್ಲಿಸು',
			'    managestudents.        name': ' ವಿದ್ಯಾರ್ಥಿಯ ಹೆಸರು',
			'    managestudents.        editstudent': ' ವಿದ್ಯಾರ್ಥಿ ವಿವರಗಳನ್ನು ಸಂಪಾದನೆ ಮಾಡಿ',
			'    managestudents.        deletestudent': ' ವಿದ್ಯಾರ್ಥಿ ವಿವರಗಳನ್ನು ಅಳಿಸಿ',
			'    managestudents.        deletestudentwarning': ' ಈ ಮಗುವಿಗೆ ನೀವು ದಾಖಲೆಗಳನ್ನು ಅಳಿಸಲು ಬಯಸುವಿರಾ?',
			'    managestudents.        delete': ' ಅಳಿಸು',
			'    managestudents.        gat': ' ಗ್ಯಾಟ್',
			'    managestudents.        studentadded': ' ವಿದ್ಯಾರ್ಥಿಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸೇರಿಸಲಾಗಿದೆ',
			'    allocatecontent.        allocatecontent': ' ವಿಷಯವನ್ನು ಹಂಚಿಕೆ ಮಾಡಿ',
			'    allocatecontent.        selectgat': ' ಗ್ಯಾಟ್ ಆಯ್ಕೆಮಾಡಿ',
			'    allocatecontent.        selecttopic': ' ವಿಷಯ ಆಯ್ಕೆಮಾಡಿ',
			'    allocatecontent.        selectvideos': ' ವೀಡಿಯೊಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'    allocatecontent.        selectedvideos': ' ಆಯ್ಕೆಯಾದ ವೀಡಿಯೊಗಳು',
			'    allocatecontent.        dateofcontent': ' ವಿಷಯವನ್ನು ಹಂಚಿಕೆ ಮಾಡಲು ದಯವಿಟ್ಟು ದಿನಾಂಕವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'    allocatecontent.        selectdate': ' ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ',
			'    takeattendance.        takeattendance': ' ಹಾಜರಾತಿಯನ್ನು ತೆಗೆದುಕೊಳ್ಳಿ',
			'    takeattendance.        date': ' ದಿನಾಂಕ',
			'    takeattendance.        dashboard': ' ಡ್ಯಾಶ್ ಬೋರ್ಡ್',
			'    takeattendance.        selectgat': ' ದಯವಿಟ್ಟು ಒಂದು Gat ಆಯ್ಕೆ ಮಾಡಿ',
			'    takeattendance.        selectdate': ' ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ',
			'    takeattendance.        save': ' ಉಳಿಸು',
			'    takeattendance.        attendancenottaken': ' ಹಾಜರಾತಿ ತೆಗೆದುಕೊಂಡಿಲ್ಲ',
			'    takeattendance.        nostudent': ' ಯಾವ ವಿದ್ಯಾರ್ಥಿಯೂ ಈ ಗ್ಯಾಟ್ ಗಾಗಿ ನೋಂದಾಯಿಸಿಲ್ಲ!',
			'    takeattendance.        holiday': ' ಇಂದು ರಜಾದಿನ',
			'    takeattendance.confirmattendance': 'ಹಾಜರಾತಿಯನ್ನು ದೃಢಪಡಿಸಿ',
			'    takeattendance.confirmwarning': 'ನೀವು ಈ ಹಾಜರಾತಿಯನ್ನು ಸಲ್ಲಿಸಲು ಬಯಸುತ್ತೀರೆಂದು ದಯವಿಟ್ಟು ದೃಢೀಕರಿಸಿ',
			'    takeattendance.cancel': 'ರದ್ದುಮಾಡಿ',
			'    takeattendance.ok': 'ಸರಿ',
			'    takeattendance.attendancetaken': 'ಹಾಜರಾತಿಯನ್ನು ಈಗಾಗಲೇ ತೆಗೆದುಕೊಳ್ಳಲಾಗಿದೆ',
			'    takeattendance.takenwarning': 'ನೀವು ಈಗಾಗಲೇ ಆ ಗಟ್ ಗಾಗಿ ಹಾಜರಾತಿಯನ್ನು ತೆಗೆದುಕೊಂಡಿದ್ದೀರಿ ಇಂದು',
			'    review.        review': ' ವಿಮರ್ಶೆ',
			'    review.        selectmonth': ' ತಿಂಗಳು ಆಯ್ಕೆಮಾಡಿ',
			'    review.        selectgat': ' ದಯವಿಟ್ಟು ಒಂದು Gat ಆಯ್ಕೆ ಮಾಡಿ',
			'    review.        attendancereview': ' ಹಾಜರಾತಿ ಪರಾಮರ್ಶೆ',
			'    review.        quizreview': ' ರಸಪ್ರಶ್ನೆ ವಿಮರ್ಶೆ',
			'    review.        videoprog': ' ವೀಡಿಯೊ ಪ್ರಗತಿ',
			'    review.        selectstudent': ' ದಯವಿಟ್ಟು ಒಬ್ಬ ವಿದ್ಯಾರ್ಥಿಯನ್ನು ಆಯ್ಕೆ ಮಾಡಿ',
			'    review.        nodata': ' ಆಯ್ಕೆಮಾಡಿದ ಫೀಲ್ಡ್ ಗಳಿಗೆ ತೋರಿಸಲು ಯಾವುದೇ ಡೇಟಾ ಇಲ್ಲ',
			'    review.        noquizgiven': ' ಯಾವುದೇ ರಸಪ್ರಶ್ನೆಗಳನ್ನು ನೀಡಲಾಗಿಲ್ಲ',
			'    review.        videono': ' ವೀಡಿಯೊ ಸಂಖ್ಯೆ.',
			'    review.        topic': ' ವಿಷಯ',
			'    review.        duration': ' ಅವಧಿ',
			'    review.        progress': ' ಪ್ರಗತಿ',
			'    review.        noattendance': ' ಹಾಜರಾತಿ ತೆಗೆದುಕೊಂಡಿಲ್ಲ',
			'    assessment.        createquiz': ' ರಸಪ್ರಶ್ನೆಯನ್ನು ರಚಿಸಿ',
			'    assessment.        createqs': ' ಪ್ರಶ್ನೆಗಳನ್ನು ರಚಿಸಿ',
			'    assessment.        createqzs': ' ರಸಪ್ರಶ್ನೆಗಳನ್ನು ರಚಿಸಿ',
			'    assessment.        allqzs': ' ಎಲ್ಲಾ ರಸಪ್ರಶ್ನೆಗಳು',
			'    assessment.        giveqz': ' ರಸಪ್ರಶ್ನೆ ನೀಡಿ',
			'    assessment.        selectgat': ' ಗ್ಯಾಟ್ ಆಯ್ಕೆಮಾಡಿ',
			'    assessment.        selecttopic': ' ವಿಷಯ ಆಯ್ಕೆಮಾಡಿ',
			'    assessment.        enterq': ' ಪ್ರಶ್ನೆ ನಮೂದಿಸಿ',
			'    assessment.        enteroptiona': ' ಆಯ್ಕೆ A ನಮೂದಿಸಿ',
			'    assessment.        enteroptionb': ' ಆಯ್ಕೆ B ನಮೂದಿಸಿ',
			'    assessment.        enteroptionc': ' ಆಯ್ಕೆ C ನಮೂದಿಸಿ',
			'    assessment.        enteroptiond': ' ಆಯ್ಕೆ D ನಮೂದಿಸಿ',
			'    assessment.        choosea': ' ಉತ್ತರವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'    assessment.        optiona': ' ಆಯ್ಕೆ A',
			'    assessment.        optionb': ' ಆಯ್ಕೆ B',
			'    assessment.        optionc': ' ಆಯ್ಕೆ ಸಿ',
			'    assessment.        optiond': ' ಆಯ್ಕೆ ಡಿ',
			'    assessment.        selectqs': '     ಪ್ರಶ್ನೆಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'    assessment.        selectatleastoneq': ' ದಯವಿಟ್ಟು ಕನಿಷ್ಠ ಒಂದು ಪ್ರಶ್ನೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'    assessment.        noqs': ' ಪ್ರದರ್ಶಿಸಲು ಯಾವುದೇ ಪ್ರಶ್ನೆಗಳಿಲ್ಲ',
			'    assessment.        makequizwarning': ' ಆಯ್ಕೆಮಾಡಿದ ಪ್ರಶ್ನೆಗಳಿಂದ ರಸಪ್ರಶ್ನೆಯನ್ನು ಮಾಡಲು ನೀವು ಖಚಿತವಾಗಿರುವಿರಾ?',
			'    assessment.        selectdate': ' ದಿನಾಂಕ ಆಯ್ಕೆಮಾಡಿ',
			'    assessment.        qztime': ' ಒಟ್ಟು ರಸಪ್ರಶ್ನೆ ಸಮಯ',
			'    assessment.        cancel': ' ರದ್ದುಮಾಡಿ',
			'    assessment.        qzcreated': ' ರಸಪ್ರಶ್ನೆಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ',
			'    assessment.        noqzs': ' !! ತೋರಿಸಲು ಯಾವುದೇ ರಸಪ್ರಶ್ನೆಗಳಿಲ್ಲ',
			'    assessment.        selectqz': ' ರಸಪ್ರಶ್ನೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ',
			'    assessment.        listogqzs': ' ಎಲ್ಲಾ ರಸಪ್ರಶ್ನೆಗಳ ಪಟ್ಟಿ',
			'    assessment.        noqzsmade': ' ಇನ್ನೂ ಯಾವುದೇ ರಸಪ್ರಶ್ನೆಗಳನ್ನು ಮಾಡಲಾಗಿಲ್ಲ',
			'    assessment.        gat': ' ಗ್ಯಾಟ್ ',
			'    assessment.        date': 'ದಿನಾಂಕ ',
			'    assessment.        deleteqzs': ' ರಸಪ್ರಶ್ನೆಯನ್ನು ಅಳಿಸು',
			'    assessment.        deleteqzwarning': ' ಈ ಹಂಚಿಕೆ ಮಾಡಿದ ರಸಪ್ರಶ್ನೆಯನ್ನು ನೀವು ಅಳಿಸಬೇಕೆಂದಿರುವುದು ಖಚಿತವೆ?',
			'    assessment.ok': 'ಸರಿ',
		};
	}
}

extension on _StringsMa {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': '    സ്റ്റുഡന്റ് മോഡ്',
			'    homepage.        takeattendance': ' ഹാജർ എടുക്കുക',
			'    homepage.        allocatecontent': ' ഉള്ളടക്കം അലോക്കേറ്റ് ചെയ്യുക',
			'    homepage.        review': ' അവലോകനം',
			'    homepage.        managestudent': ' വിദ്യാർത്ഥിയെ മാനേജുചെയ്യുക',
			'    homepage.        logout': ' ലോഗ്ഔട്ട്',
			'    homepage.        assessment': ' വിലയിരുത്തൽ',
			'    homepage.        loadsampledata': 'ഡാറ്റ നേടുക',
			'    homepage.        ekal': ' ഏകൽ ആചാര്യ',
			'    homepage.        synced': ' സെർവറിലേക്ക് ഡാറ്റ വിജയകരമായി അയച്ചു',
			'    homepage.        notsynced': ' സമന്വയിപ്പിക്കാൻ സാധ്യമല്ല, ഇന്റർനെറ്റിലേക്ക് കണക്റ്റുചെയ്യാൻ ശ്രമിക്കുക, വീണ്ടും ശ്രമിക്കുക',
			'    homepage.        loadeddata': ' ഡാറ്റ വിജയകരമായി ലോഡ് ചെയ്തു',
			'    homepage.        logoutwarning': ' നിങ്ങൾക്ക് ലോഗൗട്ട് ചെയ്യണമെന്ന് ഉറപ്പാണോ?',
			'    homepage.        yes': ' ശരി',
			'    homepage.        no': ' അല്ല',
			'    homepage.        attention': ' ശ്രദ്ധിക്കൂ!',
			'    homepage.        syncdata': ' നിങ്ങളെ വിജയകരമായി ചേർത്തു, ഡാറ്റ സമന്വയിപ്പിക്കാൻ മറക്കരുത്',
			'    studentmode.        studentmode': '     സ്റ്റുഡന്റ് മോഡ്',
			'    studentmode.        selectdate': ' തീയതി തിരഞ്ഞെടുക്കുക',
			'    studentmode.        nocontent': ' അലോക്കേറ്റ് ചെയ്ത ഉള്ളടക്കം ലഭ്യമല്ല',
			'    studentmode.        selectgat': ' കൂടുതൽ മുന്നോട്ട് പോകുന്നതിന് ഒരു ഗാറ്റ് തിരഞ്ഞെടുക്കുക',
			'    studentmode.        videoname': ' വീഡിയോയുടെ പേര്',
			'    studentmode.        gat': ' ഗാറ്റ്',
			'    studentmode.        subject': ' വിഷയം',
			'    studentmode.        topic': ' വിഷയം',
			'    studentmode.        watch': ' വീഡിയോ കാണുക',
			'    studentmode.        nocontentforgat': ' തിരഞ്ഞെടുത്ത ഗാറ്റ്- നായി അലോക്കേറ്റ് ചെയ്ത ഉള്ളടക്കം ലഭ്യമല്ല ദയവായി ആദ്യം ഉള്ളടക്കം അലോക്കേറ്റ് ചെയ്യുക',
			'    studentmode.        deletecontent': ' അലോക്കേറ്റ് ചെയ്ത ഉള്ളടക്കം ഇല്ലാതാക്കുക',
			'    studentmode.        deletewarning': ' ഈ അലോക്കേറ്റ് ചെയ്ത ഉള്ളടക്കം ഇല്ലാതാക്കണമെന്ന് നിങ്ങൾക്ക് ഉറപ്പാണോ?',
			'    studentmode.        no': ' അല്ല',
			'    studentmode.        yes': ' ശരി',
			'    managestudents.        managestudents': '      വിദ്യാർത്ഥികളെ കൈകാര്യം ചെയ്യുക',
			'    managestudents.        search': ' തിരയുക',
			'    managestudents.        notfound': ' ഫലങ്ങളൊന്നും ലഭ്യമല്ല',
			'    managestudents.        addnew': ' പുതിയ വിദ്യാർത്ഥിയെ ചേർക്കുക',
			'    managestudents.        age': ' പ്രായം',
			'    managestudents.        cancel': ' ക്യാൻസൽ ചെയ്യ്',
			'    managestudents.        submit': ' സമർപ്പിക്കുക',
			'    managestudents.        name': ' വിദ്യാർത്ഥിയുടെ പേര്',
			'    managestudents.        editstudent': ' വിദ്യാർത്ഥികളുടെ വിശദാംശങ്ങൾ ചിട്ടപ്പെടുത്തുക',
			'    managestudents.        deletestudent': ' വിദ്യാർത്ഥിയുടെ വിശദാംശങ്ങൾ ഇല്ലാതാക്കുക',
			'    managestudents.        deletestudentwarning': ' ഈ കുട്ടിക്കായുള്ള രേഖകൾ ഇല്ലാതാക്കാൻ നിങ്ങൾ ആഗ്രഹിക്കുന്നുണ്ടോ?',
			'    managestudents.        delete': ' നീക്കം ചെയ്യുക',
			'    managestudents.        gat': ' ഗാറ്റ്',
			'    managestudents.        studentadded': ' വിദ്യാർത്ഥിയെ വിജയകരമായി ചേർത്തു',
			'    allocatecontent.        allocatecontent': '       ഉള്ളടക്കം അലോക്കേറ്റ് ചെയ്യുക',
			'    allocatecontent.        selectgat': ' ഗാറ്റ് തിരഞ്ഞെടുക്കുക',
			'    allocatecontent.        selecttopic': ' വിഷയം തെരഞ്ഞെടുക്കുക',
			'    allocatecontent.        selectvideos': ' വീഡിയോകൾ തിരഞ്ഞെടുക്കുക',
			'    allocatecontent.        selectedvideos': ' തിരഞ്ഞെടുത്ത\nവീഡിയോകൾ',
			'    allocatecontent.        dateofcontent': ' ഉള്ളടക്കം അലോക്കേറ്റ് ചെയ്യുന്നതിനുള്ള തീയതി തിരഞ്ഞെടുക്കുക',
			'    allocatecontent.        selectdate': ' തീയതി തിരഞ്ഞെടുക്കുക',
			'    takeattendance.        takeattendance': ' ഹാജർ എടുക്കുക',
			'    takeattendance.        date': ' ഈന്തപ്പന',
			'    takeattendance.        dashboard': ' ഡാഷ് ബോർഡ്',
			'    takeattendance.        selectgat': ' ദയവായി ഒരു ഗാട്ട് തിരഞ്ഞെടുക്കുക',
			'    takeattendance.        selectdate': ' തീയതി\nതിരഞ്ഞെടുക്കുക',
			'    takeattendance.        save': ' സൂക്ഷിക്കുക',
			'    takeattendance.        attendancenottaken': ' ഹാജർ എടുത്തിട്ടില്ല',
			'    takeattendance.        nostudent': ' ഈ ഗാറ്റിനായി ഒരു വിദ്യാർത്ഥിയും രജിസ്റ്റർ ചെയ്തിട്ടില്ല!',
			'    takeattendance.        holiday': ' ഇന്ന് അവധിയാണ്',
			'    takeattendance.confirmattendance': 'ഹാജർ സ്ഥിരീകരിക്കുക',
			'    takeattendance.confirmwarning': 'ഈ ഹാജർ സമർപ്പിക്കാൻ നിങ്ങൾ ആഗ്രഹിക്കുന്നുവെന്ന് ദയവായി സ്ഥിരീകരിക്കുക',
			'    takeattendance.cancel': 'ക്യാൻസൽ ചെയ്യ്',
			'    takeattendance.ok': 'ശരി',
			'    takeattendance.attendancetaken': 'ഹാജർ ഇതിനകം എടുത്തിട്ടുണ്ട്',
			'    takeattendance.takenwarning': 'നിങ്ങൾ ഇന്ന് ആ ഗാട്ടിനായി ഹാജർ എടുത്തുകഴിഞ്ഞു',
			'    review.        review': '        അവലോകനം',
			'    review.        selectmonth': ' മാസം തിരഞ്ഞെടുക്കുക',
			'    review.        selectgat': ' ദയവായി ഒരു ഗാട്ട് തിരഞ്ഞെടുക്കുക',
			'    review.        attendancereview': ' ഹാജർ അവലോകനം',
			'    review.        quizreview': ' ക്വിസ് അവലോകനം',
			'    review.        videoprog': ' വീഡിയോ പുരോഗതി',
			'    review.        selectstudent': ' ദയവായി ഒരു വിദ്യാർത്ഥിയെ തിരഞ്ഞെടുക്കുക',
			'    review.        nodata': ' തിരഞ്ഞെടുത്ത ഫീൽഡുകൾക്കായി കാണിക്കേണ്ട ഡാറ്റയില്ല',
			'    review.        noquizgiven': ' ക്വിസ്സുകൾ നൽകിയിട്ടില്ല',
			'    review.        videono': ' വീഡിയോ നമ്പർ.',
			'    review.        topic': ' വിഷയം',
			'    review.        duration': ' ദൈർഘ്യം',
			'    review.        progress': ' പുരോഗതി',
			'    review.        noattendance': ' അറ്റൻഡൻസ് എടുത്തിട്ടില്ല',
			'    assessment.        createquiz': '  ക്വിസ് സൃഷ്ടിക്കുക',
			'    assessment.        createqs': ' ചോദ്യങ്ങൾ സൃഷ്ടിക്കുക',
			'    assessment.        createqzs': ' ക്വിസുകൾ സൃഷ്ടിക്കുക',
			'    assessment.        allqzs': ' എല്ലാ ക്വിസ്സുകളും',
			'    assessment.        giveqz': ' ക്വിസ് നൽകുക',
			'    assessment.        selectgat': ' ഗാറ്റ് തിരഞ്ഞെടുക്കുക',
			'    assessment.        selecttopic': ' വിഷയം\nതെരഞ്ഞെടുക്കുക',
			'    assessment.        enterq': ' ചോദ്യം നൽകുക',
			'    assessment.        enteroptiona': ' ഐച്ഛികം A നൽകുക',
			'    assessment.        enteroptionb': ' ഓപ്ഷൻ ബി നൽകുക',
			'    assessment.        enteroptionc': ' ഓപ്ഷൻ C നൽകുക',
			'    assessment.        enteroptiond': ' ഓപ്ഷൻ D നൽകുക',
			'    assessment.        choosea': ' ഉത്തരം\nതിരഞ്ഞെടുക്കുക',
			'    assessment.        optiona': ' ഐച്ഛികം എ',
			'    assessment.        optionb': ' ഓപ്ഷൻ ബി',
			'    assessment.        optionc': ' ഐച്ഛികം C',
			'    assessment.        optiond': ' ഐച്ഛികം D ',
			'    assessment.        selectqs': '    ചോദ്യങ്ങൾ തിരഞ്ഞെടുക്കുക   ',
			'    assessment.        selectatleastoneq': ' കുറഞ്ഞത് ഒരു ചോദ്യമെങ്കിലും തിരഞ്ഞെടുക്കുക',
			'    assessment.        noqs': ' പ്രദർശിപ്പിക്കാൻ ചോദ്യങ്ങളില്ല',
			'    assessment.        makequizwarning': ' തിരഞ്ഞെടുത്ത ചോദ്യങ്ങളിൽ നിന്ന് ഒരു ക്വിസ് നടത്താൻ നിങ്ങൾ ആഗ്രഹിക്കുന്നുവെന്ന് നിങ്ങൾക്ക് ഉറപ്പാണോ?',
			'    assessment.        selectdate': ' തീയതി തിരഞ്ഞെടുക്കുക',
			'    assessment.        qztime': ' മൊത്തം ക്വിസ് സമയം',
			'    assessment.        cancel': ' ക്യാൻസൽ ചെയ്യ്',
			'    assessment.        qzcreated': ' ക്വിസ് വിജയകരമായി സൃഷ്ടിച്ചു',
			'    assessment.        noqzs': ' കാണിക്കാൻ ക്വിസുകളില്ല!!',
			'    assessment.        selectqz': ' ഒരു ക്വിസ് തിരഞ്ഞെടുക്കുക',
			'    assessment.        listogqzs': ' എല്ലാ ക്വിസ്സുകളുടെയും ലിസ്റ്റ്',
			'    assessment.        noqzsmade': ' ക്വിസുകള് ഇതുവരെ നടത്തിയിട്ടില്ല',
			'    assessment.        gat': ' ഗാറ്റ് ',
			'    assessment.        date': 'ഈന്തപ്പന ',
			'    assessment.        deleteqzs': ' ഒരു ക്വിസ് ഇല്ലാതാക്കുക',
			'    assessment.        deleteqzwarning': ' ഈ അലോക്കേറ്റഡ് ക്വിസ് ഇല്ലാതാക്കണമെന്ന് നിങ്ങൾക്ക് ഉറപ്പാണോ?',
			'    assessment.ok': 'ശരി',
		};
	}
}

extension on _StringsMr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': '  विद्यार्थी मोड',
			'    homepage.        takeattendance': ' उपस्थिती घ्या',
			'    homepage.        allocatecontent': ' सामग्रीचे वाटप करा',
			'    homepage.        review': ' परीक्षण',
			'    homepage.        managestudent': ' विद्यार्थी व्यवस्थापित करा',
			'    homepage.        logout': ' लॉग आउट करा',
			'    homepage.        assessment': ' मूल्यांकन',
			'    homepage.        loadsampledata': ' डेटा लोड करा',
			'    homepage.        ekal': ' एकल आचार्य',
			'    homepage.        synced': ' सर्व्हरवर यशस्वीरित्या पाठविलेला डेटा',
			'    homepage.        notsynced': ' समक्रमित करणे शक्य नाही कृपया इंटरनेटशी कनेक्ट होण्याचा प्रयत्न करा आणि पुन्हा प्रयत्न करा',
			'    homepage.        loadeddata': ' दाखल केलेला डेटा यशस्वीरित्या दाखल केला',
			'    homepage.        logoutwarning': ' आपल्याला खात्री आहे की आपण लॉगआउट करू इच्छिता?',
			'    homepage.        yes': ' हो',
			'    homepage.        no': ' नाही',
			'    homepage.        attention': ' ध्यान!',
			'    homepage.        syncdata': ' आप सफल रूप से जोड़ा गया है डेटा समक्रमित करने से भुलना नहीं',
			'    studentmode.        studentmode': ' विद्यार्थी मोड',
			'    studentmode.        selectdate': ' निवडा तारीख',
			'    studentmode.        nocontent': ' वाटप केलेली सामग्री आढळली नाही',
			'    studentmode.        selectgat': ' पुढे जाण्यासाठी गॅट निवडा',
			'    studentmode.        videoname': ' व्हिडिओचे नाव',
			'    studentmode.        gat': ' Gat',
			'    studentmode.        subject': ' विषय',
			'    studentmode.        topic': ' विषय',
			'    studentmode.        watch': ' पाहा व्हिडिओ',
			'    studentmode.        nocontentforgat': ' निवडलेल्या गॅट करीता वाटप केलेली सामग्री आढळली नाही कृपया प्रथम सामग्रीचे वाटप करा',
			'    studentmode.        deletecontent': ' वाटप केलेली सामग्री नष्ट करा',
			'    studentmode.        deletewarning': ' आपल्याला खात्री आहे की आपण ही वाटप केलेली सामग्री हटवू इच्छिता?',
			'    studentmode.        no': ' नाही',
			'    studentmode.        yes': ' हो',
			'    managestudents.        managestudents': '  विद्यार्थ्यांचे व्यवस्थापन करा',
			'    managestudents.        search': ' शोधणे',
			'    managestudents.        notfound': ' परिणाम आढळले नाहीत',
			'    managestudents.        addnew': ' नवीन विद्यार्थी जोडा',
			'    managestudents.        age': ' युग',
			'    managestudents.        cancel': ' रद्द करा',
			'    managestudents.        submit': ' प्रस्तुत करा',
			'    managestudents.        name': ' विद्यार्थ्याचे नाव',
			'    managestudents.        editstudent': ' विद्यार्थी तपशीलसंपादन करा',
			'    managestudents.        deletestudent': ' विद्यार्थ्यांचे तपशील नष्ट करा',
			'    managestudents.        deletestudentwarning': ' तुम्हाला या मुलासाठीचे रेकॉर्ड डिलीट करायचे आहेत का?',
			'    managestudents.        delete': ' हटवा',
			'    managestudents.        gat': ' Gat',
			'    managestudents.        studentadded': ' विद्यार्थी यशस्वीरित्या जोडला गेला आहे',
			'    allocatecontent.        allocatecontent': ' सामग्रीचे वाटप करा',
			'    allocatecontent.        selectgat': ' गाट निवडा',
			'    allocatecontent.        selecttopic': ' विषय निवडा',
			'    allocatecontent.        selectvideos': ' व्हिडिओ निवडा',
			'    allocatecontent.        selectedvideos': ' निवडलेले व्हिडिओ',
			'    allocatecontent.        dateofcontent': ' कृपया सामग्रीचे वाटप करण्याकरीता तारीख निवडा',
			'    allocatecontent.        selectdate': ' निवडा तारीख',
			'    takeattendance.        takeattendance': '  उपस्थिती घ्या',
			'    takeattendance.        date': ' तारीख',
			'    takeattendance.        dashboard': ' डॅशबोर्डName',
			'    takeattendance.        selectgat': ' कृपया गॅट निवडा',
			'    takeattendance.        selectdate': ' निवडा तारीख',
			'    takeattendance.        save': ' बचत करणे',
			'    takeattendance.        attendancenottaken': ' उपस्थिती घेतली नाही',
			'    takeattendance.        nostudent': ' कोणताही विद्यार्थी या गॅटसाठी नोंदणी करत नाही!',
			'    takeattendance.        holiday': ' आज सुट्टी आहे',
			'    takeattendance.confirmattendance': 'उपस्थितीची पुष्टी करा',
			'    takeattendance.confirmwarning': 'कृपया पुष्टी करा की आपण ही उपस्थिती सबमिट करू इच्छिता',
			'    takeattendance.cancel': 'रद्द करा',
			'    takeattendance.ok': 'ठीक आहे',
			'    takeattendance.attendancetaken': 'आधीच घेतलेली उपस्थिती',
			'    takeattendance.takenwarning': 'तू आजच त्या गॅटची उपस्थिती घेतली आहेस.',
			'    review.        review': '   परीक्षण',
			'    review.        selectmonth': ' महिना निवडा',
			'    review.        selectgat': ' कृपया गॅट निवडा',
			'    review.        attendancereview': ' उपस्थिती पुनरावलोकन',
			'    review.        quizreview': ' क्विज रिव्यू',
			'    review.        videoprog': ' व्हिडिओ प्रगती',
			'    review.        selectstudent': ' कृपया विद्यार्थी निवडा',
			'    review.        nodata': ' निवडलेल्या क्षेत्र करीता दर्शविण्याकरीता माहिती नाही',
			'    review.        noquizgiven': ' क्विझेस दिले नाहीत',
			'    review.        videono': ' व्हिडिओ क्र.',
			'    review.        topic': ' विषय',
			'    review.        duration': ' कालावधी',
			'    review.        progress': ' प्रगती',
			'    review.        noattendance': ' उपस्थिती घेतली नाही',
			'    assessment.        createquiz': ' क्विझ बनवा',
			'    assessment.        createqs': ' प्रश्न निर्माण करा',
			'    assessment.        createqzs': ' क्विझेस बनवा',
			'    assessment.        allqzs': ' सर्व क्विझेस',
			'    assessment.        giveqz': ' क्विझ द्या',
			'    assessment.        selectgat': ' गाट निवडा',
			'    assessment.        selecttopic': ' विषय निवडा',
			'    assessment.        enterq': ' प्रश्न प्रविष्ट करा',
			'    assessment.        enteroptiona': ' पर्याय A प्रविष्ट करा',
			'    assessment.        enteroptionb': ' पर्याय B प्रविष्ट करा',
			'    assessment.        enteroptionc': ' पर्याय C प्रविष्ट करा',
			'    assessment.        enteroptiond': ' पर्याय D प्रविष्ट करा',
			'    assessment.        choosea': ' उत्तर निवडा',
			'    assessment.        optiona': ' पर्याय A',
			'    assessment.        optionb': ' पर्याय B',
			'    assessment.        optionc': ' पर्याय C',
			'    assessment.        optiond': ' पर्याय D ',
			'    assessment.        selectqs': '    प्रश्न निवडा   ',
			'    assessment.        selectatleastoneq': ' कृपया किमान एक प्रश्न निवडा',
			'    assessment.        noqs': ' प्रदर्शन करण्याकरीता प्रश्न नाही',
			'    assessment.        makequizwarning': ' आपल्याला खात्री आहे की आपण निवडलेल्या प्रश्नांमधून क्विझ बनवू इच्छिता?',
			'    assessment.        selectdate': ' निवडा तारीख',
			'    assessment.        qztime': ' एकूण क्विझ वेळ',
			'    assessment.        cancel': ' रद्द करा',
			'    assessment.        qzcreated': ' क्विझ यशस्वीरित्या तयार केले गेले आहे',
			'    assessment.        noqzs': ' दाखवण्यासाठी क्विझेस नाहीत!!',
			'    assessment.        selectqz': ' क्विझ निवडा',
			'    assessment.        listogqzs': ' सर्व क्विझची यादी',
			'    assessment.        noqzsmade': ' अद्याप कोणतीही क्विझेस तयार केलेली नाहीत',
			'    assessment.        gat': ' Gat ',
			'    assessment.        date': 'तारीख ',
			'    assessment.        deleteqzs': ' क्विझ हटवा',
			'    assessment.        deleteqzwarning': ' आपल्याला खात्री आहे की आपण हे वाटप केलेले क्विझ हटवू इच्छिता?',
			'    assessment.ok': 'ठीक आहे',
		};
	}
}

extension on _StringsOd {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': ' ଛାତ୍ର ମୋଡ୍',
			'    homepage.        takeattendance': ' ଉପସ୍ଥାନ ନିଅନ୍ତୁ',
			'    homepage.        allocatecontent': ' ବିଷୟବସ୍ତୁ ଆବଣ୍ଟନ',
			'    homepage.        review': ' ସମୀକ୍ଷା',
			'    homepage.        managestudent': ' ଛାତ୍ର ପରିଚାଳନା କରନ୍ତୁ',
			'    homepage.        logout': ' ଲଗ୍ ଆଉଟ୍ କରନ୍ତୁ',
			'    homepage.        assessment': ' ମୂଲ୍ୟାଙ୍କନ',
			'    homepage.        loadsampledata': ' ଡାଟା ଲୋଡ୍ କରନ୍ତୁ',
			'    homepage.        ekal': ' ଏକାଲ ଆଚାର୍ଯ୍ୟ',
			'    homepage.        synced': ' ସର୍ଭରକୁ ସଫଳତାର ସହ ଡାଟା ପ୍ରେରଣ ହୋଇଛି',
			'    homepage.        notsynced': ' ସିଙ୍କ୍ ସମ୍ଭବ ନୁହେଁ ଦୟାକରି ଇଣ୍ଟର୍ନେଟ୍ ସଂଯୋଗ କରିବାକୁ ଚେଷ୍ଟା କରନ୍ତୁ ଏବଂ ପୁନଃଚେଷ୍ଟା କରନ୍ତୁ',
			'    homepage.        loadeddata': ' ଲୋଡ୍ ହୋଇଥିବା ଡାଟା ସଫଳତାର ସହ',
			'    homepage.        logoutwarning': ' ଆପଣ ଲଗ୍ ଆଉଟ୍ କରିବାକୁ ଚାହୁଁଛନ୍ତି କି?',
			'    homepage.        yes': ' ହଁ',
			'    homepage.        no': ' ନାହିଁ',
			'    homepage.        attention': ' ଧ୍ୟାନ!',
			'    homepage.        syncdata': ' ଆପଣ ସଫଳତାର ସହ ଯୋଡି ହୋଇଯାଇଛନ୍ତି ଡାଟା ସିଙ୍କ୍ କରିବାକୁ ଭୁଲିନାହିଁ',
			'    studentmode.        studentmode': ' ଛାତ୍ର ମୋଡ୍',
			'    studentmode.        selectdate': ' ତାରିଖ ଚୟନ କରନ୍ତୁ',
			'    studentmode.        nocontent': ' କୌଣସି ଆବଣ୍ଟିତ ବିଷୟବସ୍ତୁ ମିଳିଲା ନାହିଁ',
			'    studentmode.        selectgat': ' ଆଗକୁ ବଢିବା ପାଇଁ ଏକ ଗାଟ୍ ଚୟନ କରନ୍ତୁ',
			'    studentmode.        videoname': ' ଭିଡିଓ ନାମ',
			'    studentmode.        gat': ' ଗାଟ',
			'    studentmode.        subject': ' ବିଷୟ',
			'    studentmode.        topic': ' ବିଷୟ',
			'    studentmode.        watch': ' ଭିଡିଓ ଦେଖନ୍ତୁ',
			'    studentmode.        nocontentforgat': ' ଚୟନିତ ଗାଟ୍ ପାଇଁ କୌଣସି ଆବଣ୍ଟିତ ବିଷୟବସ୍ତୁ ମିଳିଲା ନାହିଁ ଦୟାକରି ପ୍ରଥମେ ବିଷୟବସ୍ତୁ ଆବଣ୍ଟନ କରନ୍ତୁ',
			'    studentmode.        deletecontent': ' ଏକ ଆବଣ୍ଟିତ ବିଷୟବସ୍ତୁ ବିଲୋପ କରନ୍ତୁ',
			'    studentmode.        deletewarning': ' ଆପଣ ନିଶ୍ଚିତ କି ଆପଣ ଏହି ଆବଣ୍ଟିତ ବିଷୟବସ୍ତୁ ବିଲୋପ କରିବାକୁ ଚାହାଁନ୍ତି?',
			'    studentmode.        no': ' ନାହିଁ',
			'    studentmode.        yes': ' ହଁ',
			'    managestudents.        managestudents': '  ଛାତ୍ରମାନଙ୍କୁ ପରିଚାଳନା କରନ୍ତୁ',
			'    managestudents.        search': ' ସନ୍ଧାନ କରନ୍ତୁ',
			'    managestudents.        notfound': ' କୌଣସି ଫଳାଫଳ ମିଳିଲା ନାହିଁ',
			'    managestudents.        addnew': ' ନୂତନ ଛାତ୍ର ଯୋଡନ୍ତୁ',
			'    managestudents.        age': ' ବୟସ',
			'    managestudents.        cancel': ' ବାତିଲ୍‌ କରନ୍ତୁ',
			'    managestudents.        submit': ' ଜମା କରନ୍ତୁ',
			'    managestudents.        name': ' ଛାତ୍ରଙ୍କ ନାମ',
			'    managestudents.        editstudent': ' ଛାତ୍ର ବିବରଣୀ ସମ୍ପାଦନ କରନ୍ତୁ',
			'    managestudents.        deletestudent': ' ଛାତ୍ର ବିବରଣୀ ବିଲୋପ କରନ୍ତୁ',
			'    managestudents.        deletestudentwarning': ' ଆପଣ ଏହି ଶିଶୁ ପାଇଁ ରେକର୍ଡଗୁଡିକ ବିଲୋପ କରିବାକୁ ଚାହାଁନ୍ତି କି?',
			'    managestudents.        delete': ' ବିଲୋପ କରନ୍ତୁ',
			'    managestudents.        gat': ' ଗାଟ',
			'    managestudents.        studentadded': ' ଛାତ୍ରଙ୍କୁ ସଫଳତାର ସହ ଯୋଡାଯାଇଛି',
			'    allocatecontent.        allocatecontent': ' ବିଷୟବସ୍ତୁ ଆବଣ୍ଟନ',
			'    allocatecontent.        selectgat': ' ଗାଟ୍ ଚୟନ କରନ୍ତୁ',
			'    allocatecontent.        selecttopic': ' ବିଷୟ ଚୟନ କରନ୍ତୁ',
			'    allocatecontent.        selectvideos': ' ଭିଡିଓ ଗୁଡିକ ଚୟନ କରନ୍ତୁ',
			'    allocatecontent.        selectedvideos': ' ଚୟନିତ ଭିଡିଓଗୁଡିକ',
			'    allocatecontent.        dateofcontent': ' ଦୟାକରି ବିଷୟବସ୍ତୁ ଆବଣ୍ଟନ କରିବାକୁ ଏକ ତାରିଖ ଚୟନ କରନ୍ତୁ',
			'    allocatecontent.        selectdate': ' ତାରିଖ ଚୟନ କରନ୍ତୁ',
			'    takeattendance.        takeattendance': ' ଉପସ୍ଥାନ ନିଅନ୍ତୁ',
			'    takeattendance.        date': ' ତାରିଖ',
			'    takeattendance.        dashboard': ' ଡାଶବୋର୍ଡ',
			'    takeattendance.        selectgat': ' ଦୟାକରି ଏକ ଗାଟ୍ ଚୟନ କରନ୍ତୁ',
			'    takeattendance.        selectdate': ' ତାରିଖ ଚୟନ କରନ୍ତୁ',
			'    takeattendance.        save': ' ସଞ୍ଚୟ କରନ୍ତୁ',
			'    takeattendance.        attendancenottaken': ' ଉପସ୍ଥିତି ନିଆଯାଇ ନାହିଁ',
			'    takeattendance.        nostudent': ' ଏହି ଗାଟ୍ ପାଇଁ କୌଣସି ଛାତ୍ର ପଞ୍ଜିକରଣ କରୁନାହାଁନ୍ତି!',
			'    takeattendance.        holiday': ' ଆଜି ଛୁଟିଦିନ',
			'    takeattendance.confirmattendance': 'ଉପସ୍ଥାନ ନିଶ୍ଚିତ କରନ୍ତୁ',
			'    takeattendance.confirmwarning': 'ଦୟାକରି ନିଶ୍ଚିତ କରନ୍ତୁ ଯେ ଆପଣ ଏହି ଉପସ୍ଥାନ ଦାଖଲ କରିବାକୁ ଚାହାଁନ୍ତି',
			'    takeattendance.cancel': 'ବାତିଲ୍‌ କରନ୍ତୁ',
			'    takeattendance.ok': 'ଠିକ୍‌ ଅଛି',
			'    takeattendance.attendancetaken': 'ଉପସ୍ଥାନ ପୂର୍ବରୁ ନିଆଯାଇଛି',
			'    takeattendance.takenwarning': 'ଆପଣ ଆଜି ସେହି ଗାଟ୍ ପାଇଁ ଉପସ୍ଥାନ ନେଇସାରିଛନ୍ତି',
			'    review.        review': '  ସମୀକ୍ଷା',
			'    review.        selectmonth': ' ମାସ ଚୟନ କରନ୍ତୁ',
			'    review.        selectgat': ' ଦୟାକରି ଏକ ଗାଟ୍ ଚୟନ କରନ୍ତୁ',
			'    review.        attendancereview': ' ଉପସ୍ଥାନ ସମୀକ୍ଷା',
			'    review.        quizreview': ' କୁଇଜ୍ ସମୀକ୍ଷା',
			'    review.        videoprog': ' ଭିଡିଓ ପ୍ରଗତି',
			'    review.        selectstudent': ' ଦୟାକରି ଜଣେ ଛାତ୍ର ଚୟନ କରନ୍ତୁ',
			'    review.        nodata': ' ଚୟନିତ କ୍ଷେତ୍ରଗୁଡିକ ପାଇଁ ଦେଖାଇବାକୁ କୌଣସି ଡାଟା ନାହିଁ',
			'    review.        noquizgiven': ' କୌଣସି କୁଇଜ୍ ଦିଆଯାଇନାହିଁ',
			'    review.        videono': ' ଭିଡିଓ ନଂ.',
			'    review.        topic': ' ବିଷୟ',
			'    review.        duration': ' ଅବଧି',
			'    review.        progress': ' ପ୍ରଗତି',
			'    review.        noattendance': ' ଉପସ୍ଥିତି ନିଆଯାଇ ନାହିଁ',
			'    assessment.        createquiz': '  କୁଇଜ୍ ସୃଷ୍ଟି କରନ୍ତୁ',
			'    assessment.        createqs': ' ପ୍ରଶ୍ନସୃଷ୍ଟି କରନ୍ତୁ',
			'    assessment.        createqzs': ' କୁଇଜ୍ ସୃଷ୍ଟି କରନ୍ତୁ',
			'    assessment.        allqzs': ' ସମସ୍ତ କୁଇଜ୍',
			'    assessment.        giveqz': ' କୁଇଜ୍ ଦିଅନ୍ତୁ',
			'    assessment.        selectgat': ' ଗାଟ୍ ଚୟନ କରନ୍ତୁ',
			'    assessment.        selecttopic': ' ବିଷୟ ଚୟନ କରନ୍ତୁ',
			'    assessment.        enterq': ' ପ୍ରଶ୍ନ ପ୍ରବେଶ କରନ୍ତୁ',
			'    assessment.        enteroptiona': ' ବିକଳ୍ପ ଏ ପ୍ରବେଶ କରନ୍ତୁ',
			'    assessment.        enteroptionb': ' ବିକଳ୍ପ ବି ପ୍ରବେଶ କରନ୍ତୁ',
			'    assessment.        enteroptionc': ' ବିକଳ୍ପ ସି ପ୍ରବେଶ କରନ୍ତୁ',
			'    assessment.        enteroptiond': ' ବିକଳ୍ପ ଡି ପ୍ରବେଶ କରନ୍ତୁ',
			'    assessment.        choosea': ' ଉତ୍ତର ବାଛନ୍ତୁ',
			'    assessment.        optiona': ' ବିକଳ୍ପ ଏ',
			'    assessment.        optionb': ' ବିକଳ୍ପ ବି',
			'    assessment.        optionc': ' ବିକଳ୍ପ ସି',
			'    assessment.        optiond': ' ବିକଳ୍ପ ଡି ',
			'    assessment.        selectqs': '    ପ୍ରଶ୍ନଗୁଡିକ ଚୟନ କରନ୍ତୁ   ',
			'    assessment.        selectatleastoneq': ' ଦୟାକରି ଅତିକମରେ ଗୋଟିଏ ପ୍ରଶ୍ନ ଚୟନ କରନ୍ତୁ',
			'    assessment.        noqs': ' ପ୍ରଦର୍ଶନ କରିବାକୁ କୌଣସି ପ୍ରଶ୍ନ ନାହିଁ',
			'    assessment.        makequizwarning': ' ଆପଣ ନିଶ୍ଚିତ କି ଆପଣ ଚୟନିତ ପ୍ରଶ୍ନଗୁଡିକରୁ ଏକ କୁଇଜ୍ କରିବାକୁ ଚାହାଁନ୍ତି?',
			'    assessment.        selectdate': ' ତାରିଖ ଚୟନ କରନ୍ତୁ',
			'    assessment.        qztime': ' ମୋଟ କୁଇଜ୍ ସମୟ',
			'    assessment.        cancel': ' ବାତିଲ୍‌ କରନ୍ତୁ',
			'    assessment.        qzcreated': ' କୁଇଜ୍ ସଫଳତାର ସହ ସୃଷ୍ଟି ହୋଇଛି',
			'    assessment.        noqzs': ' ଦେଖାଇବାକୁ କୌଣସି କୁଇଜ୍ ନାହିଁ !!',
			'    assessment.        selectqz': ' ଏକ କୁଇଜ୍ ଚୟନ କରନ୍ତୁ',
			'    assessment.        listogqzs': ' ସମସ୍ତ କୁଇଜ୍ ର ତାଲିକା',
			'    assessment.        noqzsmade': ' ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି କୁଇଜ୍ ତିଆରି ହୋଇନାହିଁ',
			'    assessment.        gat': ' ଗାଟ ',
			'    assessment.        date': 'ତାରିଖ ',
			'    assessment.        deleteqzs': ' ଏକ କୁଇଜ୍ ବିଲୋପ କରନ୍ତୁ',
			'    assessment.        deleteqzwarning': ' ଆପଣ ନିଶ୍ଚିତ କି ଆପଣ ଏହି ଆବଣ୍ଟିତ କୁଇଜ୍ ବିଲୋପ କରିବାକୁ ଚାହାଁନ୍ତି?',
			'    assessment.ok': 'ଠିକ୍‌ ଅଛି',
		};
	}
}

extension on _StringsPn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': ' ਵਿਦਿਆਰਥੀ ਮੋਡ',
			'    homepage.        takeattendance': ' ਹਾਜ਼ਰੀ ਲਵੋ',
			'    homepage.        allocatecontent': ' ਸਮੱਗਰੀ ਨਿਰਧਾਰਿਤ ਕਰੋ',
			'    homepage.        review': ' ਪੜਤਾਲ',
			'    homepage.        managestudent': ' ਵਿਦਿਆਰਥੀ ਪਰਬੰਧ',
			'    homepage.        logout': ' ਲਾਗ ਆਉਟ',
			'    homepage.        assessment': ' ਮੁਲਾਂਕਣ',
			'    homepage.        loadsampledata': ' ਡਾਟਾ ਲੋਡ ਕਰੋ',
			'    homepage.        ekal': ' ਏਕਲ ਅਚਾਰੀਆ',
			'    homepage.        synced': ' ਡਾਟਾ ਸਰਵਰ ਉੱਤੇ ਸਫਲਤਾਪੂਰਵਕ ਭੇਜਿਆ ਗਿਆ',
			'    homepage.        notsynced': ' ਸਿੰਕ ਕਰਨਾ ਸੰਭਵ ਨਹੀਂ ਹੈ ਕਿਰਪਾ ਕਰਕੇ ਇੰਟਰਨੈੱਟ ਨਾਲ ਕਨੈਕਟ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ',
			'    homepage.        loadeddata': ' ਡਾਟਾ ਠੀਕ ਤਰ੍ਹਾਂ ਲੋਡ ਕੀਤਾ ਗਿਆ',
			'    homepage.        logoutwarning': ' ਕੀ ਤੁਸੀਂ ਯਕੀਨੀ ਤੌਰ \'ਤੇ ਲੌਗਆਊਟ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'    homepage.        yes': ' ਹਾਂ',
			'    homepage.        no': ' ਨਹੀਂ',
			'    homepage.        attention': ' ਧਿਆਨ ਦਿਓ!',
			'    homepage.        syncdata': ' ਤੁਹਾਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਜੋੜਿਆ ਗਿਆ ਹੈ ਡੇਟਾ ਡੇਟਾ ਨੂੰ ਸਿੰਕ ਕਰਨਾ ਨਾ ਭੁੱਲੋ',
			'    studentmode.        studentmode': '  ਵਿਦਿਆਰਥੀ ਮੋਡ',
			'    studentmode.        selectdate': ' ਮਿਤੀ ਚੁਣੋ',
			'    studentmode.        nocontent': ' ਕੋਈ ਵੀ ਨਿਰਧਾਰਿਤ ਸਮੱਗਰੀ ਨਹੀਂ ਲੱਭੀ',
			'    studentmode.        selectgat': ' ਹੋਰ ਅੱਗੇ ਵਧਣ ਲਈ ਇੱਕ ਗੈਟ ਦੀ ਚੋਣ ਕਰੋ',
			'    studentmode.        videoname': ' ਵਿਡੀਓ ਨਾਂ',
			'    studentmode.        gat': ' Gat',
			'    studentmode.        subject': ' ਵਿਸ਼ਾ',
			'    studentmode.        topic': ' ਵਿਸ਼ਾ',
			'    studentmode.        watch': ' ਵਿਡੀਓ ਵੇਖੋ',
			'    studentmode.        nocontentforgat': ' ਚੁਣੇ ਗਏ ਗੈਟ ਲਈ ਕੋਈ ਵੀ ਨਿਰਧਾਰਤ ਸਮੱਗਰੀ ਨਹੀਂ ਲੱਭੀ ਕਿਰਪਾ ਕਰਕੇ ਪਹਿਲਾਂ ਸਮੱਗਰੀ ਨਿਰਧਾਰਤ ਕਰੋ',
			'    studentmode.        deletecontent': ' ਨਿਯਤ ਕੀਤੀ ਸਮੱਗਰੀ ਨੂੰ ਮਿਟਾਓ',
			'    studentmode.        deletewarning': ' ਕੀ ਤੁਸੀਂ ਵਾਕਈ ਇਸ ਨਿਯਤ ਸਮੱਗਰੀ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'    studentmode.        no': ' ਨਹੀਂ',
			'    studentmode.        yes': ' ਹਾਂ',
			'    managestudents.        managestudents': '   ਵਿਦਿਆਰਥੀਆਂ ਦਾ ਪਰਬੰਧ ਕਰੋ',
			'    managestudents.        search': ' ਖੋਜ',
			'    managestudents.        notfound': ' ਕੋਈ ਨਤੀਜੇ ਨਹੀਂ ਲੱਭੇ',
			'    managestudents.        addnew': ' ਨਵਾਂ ਵਿਦਿਆਰਥੀ ਸ਼ਾਮਲ',
			'    managestudents.        age': ' ਉਮਰ',
			'    managestudents.        cancel': ' ਰੱਦ ਕਰੋ',
			'    managestudents.        submit': ' ਸਪੁਰਦ ਕਰੋ',
			'    managestudents.        name': ' ਵਿਦਿਆਰਥੀ ਦਾ ਨਾਮ',
			'    managestudents.        editstudent': ' ਵਿਦਿਆਰਥੀ ਵੇਰਵਾ ਸੋਧ',
			'    managestudents.        deletestudent': ' ਵਿਦਿਆਰਥੀ ਵੇਰਵੇ ਹਟਾਓ',
			'    managestudents.        deletestudentwarning': ' ਕੀ ਤੁਸੀਂ ਇਸ ਬੱਚੇ ਲਈ ਰਿਕਾਰਡਾਂ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'    managestudents.        delete': ' ਹਟਾਓ',
			'    managestudents.        gat': ' Gat',
			'    managestudents.        studentadded': ' ਵਿਦਿਆਰਥੀ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਸ਼ਾਮਲ ਕਰ ਲਿਆ ਗਿਆ ਹੈ',
			'    allocatecontent.        allocatecontent': '    ਸਮੱਗਰੀ ਨਿਰਧਾਰਿਤ ਕਰੋ',
			'    allocatecontent.        selectgat': ' ਗੈਟ ਚੁਣੋ',
			'    allocatecontent.        selecttopic': ' ਵਿਸ਼ਾ ਚੁਣੋ',
			'    allocatecontent.        selectvideos': ' ਵਿਡੀਓ ਚੁਣੋ',
			'    allocatecontent.        selectedvideos': ' ਚੁਣੇ ਵਿਡੀਓ',
			'    allocatecontent.        dateofcontent': ' ਕਿਰਪਾ ਕਰਕੇ ਸਮੱਗਰੀ ਨੂੰ ਨਿਰਧਾਰਤ ਕਰਨ ਲਈ ਕੋਈ ਮਿਤੀ ਚੁਣੋ',
			'    allocatecontent.        selectdate': ' ਮਿਤੀ ਚੁਣੋ',
			'    takeattendance.        takeattendance': ' ਹਾਜ਼ਰੀ ਲਵੋ',
			'    takeattendance.        date': ' ਮਿਤੀ',
			'    takeattendance.        dashboard': 'ਡੈਸ਼ਬੋਰਡ',
			'    takeattendance.        selectgat': ' ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਗੈਟ ਦੀ ਚੋਣ ਕਰੋ',
			'    takeattendance.        selectdate': ' ਮਿਤੀ ਚੁਣੋ',
			'    takeattendance.        save': ' ਸੰਭਾਲੋ',
			'    takeattendance.        attendancenottaken': ' ਹਾਜ਼ਰੀ ਨਹੀਂ ਲਈ ਗਈ',
			'    takeattendance.        nostudent': ' ਕੋਈ ਵੀ ਵਿਦਿਆਰਥੀ ਇਸ ਗੈਟ ਲਈ ਰਜਿਸਟਰ ਨਹੀਂ ਹੈ!',
			'    takeattendance.        holiday': ' ਅੱਜ ਛੁੱਟੀ ਹੈ',
			'    takeattendance.confirmattendance': 'ਹਾਜ਼ਰੀ ਪੁਸ਼ਟੀ',
			'    takeattendance.confirmwarning': 'ਕਿਰਪਾ ਕਰਕੇ ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਤੁਸੀਂ ਇਸ ਹਾਜ਼ਰੀ ਨੂੰ ਸਪੁਰਦ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ',
			'    takeattendance.cancel': 'ਰੱਦ ਕਰੋ',
			'    takeattendance.ok': 'ਠੀਕ ਹੈ',
			'    takeattendance.attendancetaken': 'ਹਾਜ਼ਰੀ ਪਹਿਲਾਂ ਹੀ ਲਈ ਗਈ ਹੈ',
			'    takeattendance.takenwarning': 'ਤੁਸੀਂ ਅੱਜ ਹੀ ਉਸ ਗੈਟ ਵਾਸਤੇ ਹਾਜ਼ਰੀ ਲੈ ਚੁੱਕੇ ਹੋ',
			'    review.        review': '     ਪੜਤਾਲ',
			'    review.        selectmonth': ' ਮਹੀਨਾ ਚੁਣੋ',
			'    review.        selectgat': ' ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਗੈਟ ਦੀ ਚੋਣ ਕਰੋ',
			'    review.        attendancereview': ' ਹਾਜ਼ਰੀ ਪੜਤਾਲ',
			'    review.        quizreview': ' ਕਵਿਜ਼ ਰੀਵਿਊ',
			'    review.        videoprog': ' ਵਿਡੀਓ ਤਰੱਕੀ',
			'    review.        selectstudent': ' ਕਿਰਪਾ ਕਰਕੇ ਕੋਈ ਵਿਦਿਆਰਥੀ ਚੁਣੋ',
			'    review.        nodata': ' ਚੁਣੇ ਗਏ ਖੇਤਰਾਂ ਲਈ ਦਿਖਾਉਣ ਲਈ ਕੋਈ ਡੇਟਾ ਨਹੀਂ ਹੈ',
			'    review.        noquizgiven': ' ਕੋਈ ਕਵਿਜ਼ ਨਹੀਂ ਦਿੱਤੀ ਗਈ',
			'    review.        videono': ' ਵੀਡੀਓ ਨੰ.',
			'    review.        topic': ' ਵਿਸ਼ਾ',
			'    review.        duration': ' ਅੰਤਰਾਲ',
			'    review.        progress': ' ਤਰੱਕੀ',
			'    review.        noattendance': ' ਹਾਜ਼ਰੀ ਨਹੀਂ ਲਈ ਗਈ',
			'    assessment.        createquiz': '     ਕਵਿੱਜ਼ ਬਣਾਓ',
			'    assessment.        createqs': ' ਸਵਾਲ ਬਣਾਓ',
			'    assessment.        createqzs': ' ਕਵਿੱਜ਼ ਬਣਾਓ',
			'    assessment.        allqzs': ' ਸਭ ਕਵਿੱਜ਼',
			'    assessment.        giveqz': ' ਕਵਿੱਜ਼ ਦਿਓ',
			'    assessment.        selectgat': ' ਗੈਟ ਚੁਣੋ',
			'    assessment.        selecttopic': ' ਵਿਸ਼ਾ ਚੁਣੋ',
			'    assessment.        enterq': ' ਸਵਾਲ ਦਿਓ',
			'    assessment.        enteroptiona': ' ਚੋਣ A ਦਰਜ਼ ਕਰੋ',
			'    assessment.        enteroptionb': ' ਚੋਣ B ਦਰਜ਼ ਕਰੋ',
			'    assessment.        enteroptionc': ' ਚੋਣ C ਦਰਜ਼ ਕਰੋ',
			'    assessment.        enteroptiond': ' ਚੋਣ D ਦਰਜ਼ ਕਰੋ',
			'    assessment.        choosea': ' ਜਵਾਬ ਚੁਣੋ',
			'    assessment.        optiona': ' ਚੋਣ A',
			'    assessment.        optionb': ' ਚੋਣ B',
			'    assessment.        optionc': ' ਚੋਣ C',
			'    assessment.        optiond': ' ਚੋਣ D ',
			'    assessment.        selectqs': '         ਸਵਾਲ ਚੁਣੋ   ',
			'    assessment.        selectatleastoneq': ' ਕਿਰਪਾ ਕਰਕੇ ਘੱਟੋ-ਘੱਟ ਇੱਕ ਸਵਾਲ ਚੁਣੋ',
			'    assessment.        noqs': ' ਪ੍ਰਦਰਸ਼ਿਤ ਕਰਨ ਲਈ ਕੋਈ ਸਵਾਲ ਨਹੀਂ ਹਨ',
			'    assessment.        makequizwarning': ' ਕੀ ਤੁਹਾਨੂੰ ਪੱਕਾ ਯਕੀਨ ਹੈ ਕਿ ਤੁਸੀਂ ਚੁਣੇ ਗਏ ਸਵਾਲਾਂ ਵਿੱਚੋਂ ਇੱਕ ਕਵਿੱਜ਼ ਬਣਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'    assessment.        selectdate': ' ਮਿਤੀ ਚੁਣੋ',
			'    assessment.        qztime': ' ਕੁੱਲ ਕਵਿਜ਼ ਸਮਾਂ',
			'    assessment.        cancel': ' ਰੱਦ ਕਰੋ',
			'    assessment.        qzcreated': ' ਕਵਿੱਜ਼ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਇਆ ਗਿਆ ਹੈ',
			'    assessment.        noqzs': ' ਦਿਖਾਉਣ ਲਈ ਕੋਈ ਕਵਿਜ਼ਾਂ ਨਹੀਂ ਹਨ !!',
			'    assessment.        selectqz': ' ਇੱਕ ਕਵਿੱਜ਼ ਚੁਣੋ',
			'    assessment.        listogqzs': ' ਸਾਰੀਆਂ ਕਵਿਜ਼ਾਂ ਦੀ ਸੂਚੀ',
			'    assessment.        noqzsmade': ' ਹਾਲੇ ਤੱਕ ਕੋਈ ਕਵਿੱਜ਼ਾਂ ਨਹੀਂ ਬਣਾਈਆਂ ਗਈਆਂ',
			'    assessment.        gat': ' Gat ',
			'    assessment.        date': 'ਮਿਤੀ ',
			'    assessment.        deleteqzs': ' ਕਵਿੱਜ਼ ਹਟਾਓ',
			'    assessment.        deleteqzwarning': ' ਕੀ ਤੁਹਾਨੂੰ ਪੱਕਾ ਯਕੀਨ ਹੈ ਕਿ ਤੁਸੀਂ ਇਸ ਅਧਿਸੂਚਿਤ ਕਵਿਜ਼ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?',
			'    assessment.ok': 'ਠੀਕ ਹੈ',
		};
	}
}

extension on _StringsTl {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': ' స్టూడెంట్ మోడ్',
			'    homepage.        takeattendance': ' హాజరు తీసుకోండి',
			'    homepage.        allocatecontent': ' కంటెంట్ కేటాయించు',
			'    homepage.        review': ' సమీక్ష',
			'    homepage.        managestudent': ' విద్యార్థిని నిర్వహించు',
			'    homepage.        logout': ' లాగ్ అవుట్',
			'    homepage.        assessment': ' అసెస్ మెంట్',
			'    homepage.        loadsampledata': ' లోడ్ డేటా',
			'    homepage.        ekal': ' ఏకల్ ఆచార్య',
			'    homepage.        synced': ' డేటా విజయవంతంగా సర్వర్ కు పంపబడింది',
			'    homepage.        notsynced': ' సమకాలీకరించడం సాధ్యం కాదు దయచేసి ఇంటర్నెట్ కు కనెక్ట్ కావడానికి ప్రయత్నించండి మరియు మళ్లీ ప్రయత్నించండి',
			'    homepage.        loadeddata': ' డేటా విజయవంతంగా లోడ్ చేయబడింది',
			'    homepage.        logoutwarning': ' మీరు కచ్చితంగా నిష్క్రమించాలని అనుకుంటున్నారా?',
			'    homepage.        yes': ' అవును',
			'    homepage.        no': ' కాదు',
			'    homepage.        attention': ' ధ్యాస!',
			'    homepage.        syncdata': ' మీరు విజయవంతంగా జతచేయబడ్డారు డేటాను సింక్ చేయడం మర్చిపోవద్దు',
			'    studentmode.        studentmode': ' స్టూడెంట్ మోడ్',
			'    studentmode.        selectdate': ' తేదీని ఎంచుకోండి',
			'    studentmode.        nocontent': ' కేటాయించబడ్డ కంటెంట్ ఏదీ కనుగొనబడలేదు',
			'    studentmode.        selectgat': ' తదుపరి ముందుకు సాగడం కొరకు ఒక గాట్ ఎంచుకోండి',
			'    studentmode.        videoname': ' వీడియో పేరు',
			'    studentmode.        gat': ' గాట్',
			'    studentmode.        subject': ' పాలితుడు',
			'    studentmode.        topic': ' అంశం',
			'    studentmode.        watch': ' వీడియో చూడండి',
			'    studentmode.        nocontentforgat': ' ఎంపిక చేయబడ్డ గట్ కొరకు కేటాయించబడ్డ కంటెంట్ ఏదీ కనుగొనబడలేదు దయచేసి మొదట కంటెంట్ ని కేటాయించండి',
			'    studentmode.        deletecontent': ' కేటాయించిన కంటెంట్ ని డిలీట్ చేయండి',
			'    studentmode.        deletewarning': ' ఈ కేటాయించబడ్డ కంటెంట్ ని మీరు కచ్చితంగా డిలీట్ చేయాలని అనుకుంటున్నారా?',
			'    studentmode.        no': ' కాదు',
			'    studentmode.        yes': ' అవును',
			'    managestudents.        managestudents': '  విద్యార్థులను నిర్వహించండి',
			'    managestudents.        search': ' వెతుకు',
			'    managestudents.        notfound': ' ఎలాంటి ఫలితాలు కనుగొనబడలేదు',
			'    managestudents.        addnew': ' కొత్త విద్యార్థిని జోడించు',
			'    managestudents.        age': ' వయసు',
			'    managestudents.        cancel': ' రద్దు',
			'    managestudents.        submit': ' సమర్పించు',
			'    managestudents.        name': ' విద్యార్థి పేరు',
			'    managestudents.        editstudent': ' విద్యార్థి వివరాలను సవరించు',
			'    managestudents.        deletestudent': ' విద్యార్థి వివరాలను డిలీట్ చేయండి',
			'    managestudents.        deletestudentwarning': ' ఈ బిడ్డ కొరకు రికార్డ్ లను మీరు డిలీట్ చేయాలని అనుకుంటున్నారా?',
			'    managestudents.        delete': ' పరిహరించు',
			'    managestudents.        gat': ' గాట్',
			'    managestudents.        studentadded': ' విద్యార్థి విజయవంతంగా జోడించబడ్డాడు',
			'    allocatecontent.        allocatecontent': ' కంటెంట్ కేటాయించు',
			'    allocatecontent.        selectgat': ' గాట్ ఎంచుకోండి',
			'    allocatecontent.        selecttopic': ' టాపిక్ ఎంచుకోండి',
			'    allocatecontent.        selectvideos': ' వీడియోలను ఎంచుకోండి',
			'    allocatecontent.        selectedvideos': ' ఎంచుకున్న వీడియోలు',
			'    allocatecontent.        dateofcontent': ' కంటెంట్ కేటాయించడం కొరకు దయచేసి ఒక తేదీని ఎంచుకోండి',
			'    allocatecontent.        selectdate': ' తేదీని ఎంచుకోండి',
			'    takeattendance.        takeattendance': ' హాజరు తీసుకోండి',
			'    takeattendance.        date': ' ఖర్జూరం',
			'    takeattendance.        dashboard': ' డ్యాష్ బోర్డ్',
			'    takeattendance.        selectgat': ' దయచేసి ఒక గాట్ ఎంచుకోండి',
			'    takeattendance.        selectdate': ' తేదీని ఎంచుకోండి',
			'    takeattendance.        save': ' కాపాడు',
			'    takeattendance.        attendancenottaken': ' హాజరు తీసుకోబడలేదు',
			'    takeattendance.        nostudent': ' ఏ విద్యార్థి కూడా ఈ గాట్ కొరకు రిజిస్టర్ చేసుకోలేదు!',
			'    takeattendance.        holiday': ' ఈ రోజు సెలవుదినం',
			'    takeattendance.confirmattendance': 'హాజరును ధృవీకరించండి',
			'    takeattendance.confirmwarning': 'ఈ హాజరును మీరు సబ్మిట్ చేయాలని అనుకుంటున్నట్లుగా దయచేసి ధృవీకరించండి.',
			'    takeattendance.cancel': 'రద్దు',
			'    takeattendance.ok': 'సరే',
			'    takeattendance.attendancetaken': 'హాజరు ఇప్పటికే తీసుకోబడింది',
			'    takeattendance.takenwarning': 'ఈ రోజు ఆ గాట్ కొరకు మీరు ఇప్పటికే అటెండెన్స్ తీసుకున్నారు.',
			'    review.        review': ' సమీక్ష',
			'    review.        selectmonth': ' నెలను ఎంచుకోండి',
			'    review.        selectgat': ' దయచేసి ఒక గాట్ ఎంచుకోండి',
			'    review.        attendancereview': ' హాజరు సమీక్ష',
			'    review.        quizreview': ' క్విజ్ రివ్యూ',
			'    review.        videoprog': ' వీడియో పురోగతి',
			'    review.        selectstudent': ' దయచేసి ఒక విద్యార్థిని ఎంచుకోండి',
			'    review.        nodata': ' ఎంపిక చేయబడ్డ ఫీల్డ్ ల కొరకు చూపించడానికి ఎలాంటి డేటా లేదు',
			'    review.        noquizgiven': ' క్విజ్ లు ఏవీ ఇవ్వబడలేదు',
			'    review.        videono': ' వీడియో నెంబరు.',
			'    review.        topic': ' అంశం',
			'    review.        duration': ' గడువు',
			'    review.        progress': ' ప్రగతి',
			'    review.        noattendance': ' హాజరు తీసుకోబడలేదు',
			'    assessment.        createquiz': ' క్విజ్ సృష్టించు',
			'    assessment.        createqs': ' ప్రశ్నలు సృష్టించండి',
			'    assessment.        createqzs': ' క్విజ్ లను సృష్టించండి',
			'    assessment.        allqzs': ' అన్ని క్విజ్ లు',
			'    assessment.        giveqz': ' క్విజ్ ఇవ్వండి',
			'    assessment.        selectgat': ' గాట్ ను ఎంచుకోండి',
			'    assessment.        selecttopic': ' టాపిక్ ఎంచుకోండి',
			'    assessment.        enterq': ' ప్రశ్న నమోదు చేయండి',
			'    assessment.        enteroptiona': ' ఆప్షన్ A ఎంటర్ చేయండి',
			'    assessment.        enteroptionb': ' ఆప్షన్ B ఎంటర్ చేయండి',
			'    assessment.        enteroptionc': ' ఆప్షన్ C ఎంటర్ చేయండి',
			'    assessment.        enteroptiond': ' ఆప్షన్ D ఎంటర్ చేయండి',
			'    assessment.        choosea': ' సమాధానం ఎంచుకోండి',
			'    assessment.        optiona': ' ఆప్షన్ A',
			'    assessment.        optionb': ' ఆప్షన్ B',
			'    assessment.        optionc': ' ఆప్షన్ C',
			'    assessment.        optiond': ' ఆప్షన్ D ',
			'    assessment.        selectqs': '    ప్రశ్నలను ఎంచుకోండి',
			'    assessment.        selectatleastoneq': ' దయచేసి కనీసం ఒక ప్రశ్నను ఎంచుకోండి',
			'    assessment.        noqs': ' ప్రదర్శించడానికి ఎలాంటి ప్రశ్నలు లేవు',
			'    assessment.        makequizwarning': ' ఎంపిక చేయబడ్డ ప్రశ్నల నుంచి క్విజ్ చేయాలని మీరు ఖచ్చితంగా అనుకుంటున్నారా?',
			'    assessment.        selectdate': ' తేదీని ఎంచుకోండి',
			'    assessment.        qztime': ' మొత్తం క్విజ్ సమయం',
			'    assessment.        cancel': ' రద్దు',
			'    assessment.        qzcreated': ' క్విజ్ విజయవంతంగా సృష్టించబడింది',
			'    assessment.        noqzs': ' !! చూపించడానికి క్విజ్ లు లేవు',
			'    assessment.        selectqz': ' క్విజ్ ఎంచుకోండి',
			'    assessment.        listogqzs': ' అన్ని క్విజ్ ల జాబితా',
			'    assessment.        noqzsmade': ' ఇంకా క్విజ్ లు తయారు చేయబడలేదు',
			'    assessment.        gat': ' గాట్ ',
			'    assessment.        date': 'ఖర్జూరం ',
			'    assessment.        deleteqzs': ' క్విజ్ ని డిలీట్ చేయండి',
			'    assessment.        deleteqzwarning': ' ఈ కేటాయించబడ్డ క్విజ్ ని మీరు కచ్చితంగా డిలీట్ చేయాలని అనుకుంటున్నారా?',
			'    assessment.ok': 'సరే',
		};
	}
}

extension on _StringsTm {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'homepage.studentmode': 'மாணவர் முறை',
			'homepage.takeattendance': 'வருகையை எடுத்துக் கொள்ளுங்கள்',
			'homepage.allocatecontent': 'உள்ளடக்கத்தை ஒதுக்கு',
			'homepage.review': 'மறுசீராய்வு',
			'homepage.managestudent': 'மாணவரை நிர்வகித்தல்',
			'homepage.logout': 'வெளியேறு',
			'homepage.assessment': 'மதிப்பீடு',
			'homepage.loadsampledata': 'தரவை ஏற்றுதல்',
			'homepage.ekal': 'ஏகல் ஆச்சார்யா',
			'homepage.synced': 'தரவு வெற்றிகரமாக சேவையகத்திற்கு அனுப்பப்பட்டது',
			'homepage.notsynced': 'ஒத்திசைக்கப்பட்டது சாத்தியமில்லை தயவுசெய்து இணையத்துடன் இணைக்க முயற்சி செய்து மீண்டும் முயற்சிக்கவும்',
			'homepage.loadeddata': 'ஏற்றப்பட்ட தரவு வெற்றிகரமாக',
			'homepage.logoutwarning': 'நிச்சயமாக வெளியேற விரும்புகிறீர்களா?',
			'homepage.yes': 'ஆம்',
			'homepage.no': 'இல்லை',
			'homepage.attention': 'கவனம்!',
			'homepage.syncdata': 'நீங்கள் வெற்றிகரமாக சேர்க்கப்பட்டுள்ளீர்கள் தரவை ஒத்திசைக்க மறக்காதீர்கள் தரவு',
			'studentmode.studentmode': 'மாணவர் முறை',
			'studentmode.selectdate': 'தேதி தேர்ந்தெடு`',
			'studentmode.nocontent': 'ஒதுக்கப்பட்ட உள்ளடக்கம் எதுவும் காணப்படவில்லை',
			'studentmode.selectgat': 'மேலும் தொடர ஒரு Gat ஐத் தேர்ந்தெடுக்கவும்',
			'studentmode.videoname': 'வீடியோ பெயர்',
			'studentmode.gat': 'காட்',
			'studentmode.subject': 'குடிமகன்',
			'studentmode.topic': 'தலைப்பு',
			'studentmode.watch': 'வீடியோவைப் பார்க்கவும்',
			'studentmode.nocontentforgat': 'தேர்ந்தெடுக்கப்பட்ட Gat க்கு ஒதுக்கப்பட்ட உள்ளடக்கம் எதுவும் காணப்படவில்லை தயவுசெய்து முதலில் உள்ளடக்கத்தை ஒதுக்கவும்',
			'studentmode.deletecontent': 'ஒதுக்கப்பட்ட உள்ளடக்கத்தை நீக்கு',
			'studentmode.deletewarning': 'இந்த ஒதுக்கப்பட்ட உள்ளடக்கத்தை நீக்க நிச்சயமாக விரும்புகிறீர்களா?',
			'studentmode.no': 'இல்லை',
			'studentmode.yes': 'ஆம்',
			'managestudents.managestudents': 'மாணவர்களை நிர்வகித்தல்',
			'managestudents.search': 'தேட்டம்',
			'managestudents.notfound': 'முடிவுகள் எதுவும் காணப்படவில்லை',
			'managestudents.addnew': 'புதிய மாணவரை சேர்',
			'managestudents.age': 'வாழ்நாள்',
			'managestudents.cancel': 'ரத்து',
			'managestudents.submit': 'சமர்ப்பிக்க',
			'managestudents.name': 'மாணவரின் பெயர்',
			'managestudents.editstudent': 'மாணவர் விவரங்களைத் திருத்து',
			'managestudents.deletestudent': 'மாணவர் விவரங்களை நீக்கு',
			'managestudents.deletestudentwarning': 'இந்தக் குழந்தைக்கான பதிவேடுகளை நீக்க விரும்புகிறீர்களா?',
			'managestudents.delete': 'தீங்கான',
			'managestudents.gat': 'காட்',
			'managestudents.studentadded': 'மாணவர் வெற்றிகரமாகச் சேர்க்கப்பட்டுள்ளார்',
			'allocatecontent.allocatecontent': 'உள்ளடக்கத்தை ஒதுக்கு',
			'allocatecontent.selectgat': 'கேட் தேர்ந்தெடு',
			'allocatecontent.selecttopic': 'தலைப்பை தேர்ந்தெடு',
			'allocatecontent.selectvideos': 'வீடியோக்களைத் தேர்ந்தெடுக்கவும்',
			'allocatecontent.selectedvideos': 'தேர்ந்தெடுக்கப்பட்ட\nவீடியோக்கள்',
			'allocatecontent.dateofcontent': 'உள்ளடக்கத்தை ஒதுக்க ஒரு தேதியை தேர்ந்தெடுக்கவும்',
			'allocatecontent.selectdate': 'தேதி தேர்ந்தெடு',
			'takeattendance.takeattendance': 'வருகையை எடுத்துக் கொள்ளுங்கள்',
			'takeattendance.date': 'பேரீச்ச மரம்',
			'takeattendance.dashboard': 'சேற்றுக்காப்பு',
			'takeattendance.selectgat': 'தயவுசெய்து ஒரு Gat ஐத் தேர்ந்தெடுக்கவும்',
			'takeattendance.selectdate': 'தேதி தேர்ந்தெடு',
			'takeattendance.save': 'கெலிப்புத்தடங்கல்',
			'takeattendance.attendancenottaken': 'வருகைப் பதிவு\nஎடுக்கப்படவில்லை',
			'takeattendance.nostudent': 'இந்த Gat க்கு எந்த மாணவரும் பதிவு செய்யவில்லை!',
			'takeattendance.holiday': 'இன்று விடுமுறை நாள்',
			'takeattendance.confirmattendance': 'வருகையை உறுதிப்படுத்தவும்',
			'takeattendance.confirmwarning': 'இந்த வருகையை நீங்கள் சமர்ப்பிக்க விரும்புகிறீர்கள் என்பதை உறுதிப்படுத்தவும்',
			'takeattendance.cancel': 'ரத்து',
			'takeattendance.ok': 'சரி',
			'takeattendance.attendancetaken': 'ஏற்கனவே எடுக்கப்பட்ட வருகை',
			'takeattendance.takenwarning': 'நீங்கள் ஏற்கனவே இன்று அந்த gat க்கான வருகையை எடுத்துள்ளீர்கள்',
			'review.review': 'மறுசீராய்வு',
			'review.selectmonth': 'மாதம் தேர்ந்தெடு',
			'review.selectgat': 'தயவுசெய்து ஒரு Gat ஐத் தேர்ந்தெடுக்கவும்',
			'review.attendancereview': 'வருகை மீளாய்வு',
			'review.quizreview': 'வினாடி வினா விமர்சனம்',
			'review.videoprog': 'வீடியோ முன்னேற்றம்',
			'review.selectstudent': 'தயவுசெய்து ஒரு மாணவரைத் தேர்ந்தெடுக்கவும்',
			'review.nodata': 'தேர்ந்தெடுத்த புலங்களுக்கு காண்பிக்க தரவு இல்லை',
			'review.noquizgiven': 'வினாடி வினாக்கள் எதுவும் கொடுக்கப்படவில்லை',
			'review.videono': 'வீடியோ எண்.',
			'review.topic': 'தலைப்பு',
			'review.duration': 'காலத்தொடர்ச்சி',
			'review.progress': 'முன்னேற்றம்',
			'review.noattendance': 'வருகைப் பதிவு எடுக்கப்படவில்லை',
			'assessment.createquiz': 'வினாடி வினாவை உருவாக்கு',
			'assessment.createqs': 'கேள்விகளை உருவாக்கு',
			'assessment.createqzs': 'வினாடி வினாக்களை உருவாக்கு',
			'assessment.allqzs': 'அனைத்து வினாடி வினாக்கள்',
			'assessment.giveqz': 'வினாடி வினா கொடுங்கள்',
			'assessment.selectgat': 'கேட் தேர்ந்தெடு',
			'assessment.selecttopic': 'தலைப்பை தேர்ந்தெடு',
			'assessment.enterq': 'கேள்வியை உள்ளிடவும்',
			'assessment.enteroptiona': 'விருப்பம் A ஐ உள்ளிடவும்',
			'assessment.enteroptionb': 'விருப்பம் B ஐ உள்ளிடவும்',
			'assessment.enteroptionc': 'விருப்பம் C ஐ உள்ளிடவும்',
			'assessment.enteroptiond': 'விருப்பம் D ஐ உள்ளிடவும்',
			'assessment.choosea': 'பதில் தேர்ந்தெடு',
			'assessment.optiona': 'விருப்பம் A',
			'assessment.optionb': 'விருப்பம் B',
			'assessment.optionc': 'விருப்பம் C',
			'assessment.optiond': 'விருப்பம் D ',
			'assessment.selectqs': 'கேள்விகளைத் தேர்ந்தெடுங்கள்',
			'assessment.selectatleastoneq': 'தயவுசெய்து குறைந்தபட்சம் ஒரு கேள்வியையாவது தேர்ந்தெடுக்கவும்',
			'assessment.noqs': 'காண்பிக்க கேள்விகள் இல்லை',
			'assessment.makequizwarning': 'தேர்ந்தெடுக்கப்பட்ட கேள்விகளில் இருந்து ஒரு வினாடி வினாவை உருவாக்க நிச்சயமாக விரும்புகிறீர்களா?',
			'assessment.selectdate': 'தேதி தேர்ந்தெடு',
			'assessment.qztime': 'மொத்த வினாடி வினா நேரம்',
			'assessment.cancel': 'ரத்து',
			'assessment.ok': 'சரி',
			'assessment.qzcreated': 'வினாடி வினா வெற்றிகரமாக உருவாக்கப்பட்டது',
			'assessment.noqzs': 'காண்பிக்க வினாடி வினாக்கள் இல்லை',
			'assessment.selectqz': 'வினாடி வினாவைத் தேர்ந்தெடுக்கவும்',
			'assessment.listogqzs': 'அனைத்து வினாடி வினாக்களின் பட்டியல்',
			'assessment.noqzsmade': 'இன்னும் வினாடி வினாக்கள் இல்லை',
			'assessment.gat': 'காட் ',
			'assessment.date': 'பேரீச்ச மரம் ',
			'assessment.deleteqzs': 'ஒரு வினாடி வினாவை நீக்கு',
			'assessment.deleteqzwarning': 'இந்த ஒதுக்கப்பட்ட வினாடி வினாவை நீக்க நிச்சயமாக விரும்புகிறீர்களா?',
		};
	}
}

extension on _StringsUr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'    homepage.        studentmode': '   طالب علم موڈ',
			'    homepage.        takeattendance': ' حاضری لیں',
			'    homepage.        allocatecontent': ' مواد مختص کریں',
			'    homepage.        review': ' جائزہ',
			'    homepage.        managestudent': ' طالب علم کا انتظام کریں',
			'    homepage.        logout': ' لاگ آؤٹ کریں',
			'    homepage.        assessment': ' تشخیص',
			'    homepage.        loadsampledata': ' کوائف لوڈ کریں',
			'    homepage.        ekal': ' ایکل آچاریہ',
			'    homepage.        synced': ' پیش کار کو کامیابی سے کوائف بھیجے گئے',
			'    homepage.        notsynced': ' ہم آہنگ ممکن نہیں براہ کرم انٹرنیٹ سے جڑنے کی کوشش کریں اور دوبارہ کوشش کریں',
			'    homepage.        loadeddata': ' لوڈ شدہ کوائف کامیابی سے',
			'    homepage.        logoutwarning': ' کیا آپ کو یقین ہے کہ آپ لاگ آؤٹ کرنا چاہتے ہیں؟',
			'    homepage.        yes': ' ہاں',
			'    homepage.        no': ' نہيں',
			'    homepage.        attention': ' توجہ!',
			'    homepage.        syncdata': ' آپ کو کامیابی سے شامل کیا جاتا ہے ڈیٹا کوائف کو سنک کرنا نہیں بھولتا',
			'    studentmode.        studentmode': ' طالب علم موڈ',
			'    studentmode.        selectdate': ' تاریخ منتخب کریں',
			'    studentmode.        nocontent': ' کوئی مختص مواد نہیں ملا',
			'    studentmode.        selectgat': ' مزید آگے بڑھنے کے لیے ایک گیٹ منتخب کریں',
			'    studentmode.        videoname': ' ویڈیو نام',
			'    studentmode.        gat': ' گیٹ',
			'    studentmode.        subject': ' موضوع',
			'    studentmode.        topic': ' موضوع',
			'    studentmode.        watch': ' ویڈیو دیکھیں',
			'    studentmode.        nocontentforgat': ' منتخب گیٹ کے لئے کوئی مختص مواد نہیں ملا براہ کرم پہلے مواد مختص کریں',
			'    studentmode.        deletecontent': ' مختص کردہ مواد حذف کریں',
			'    studentmode.        deletewarning': ' کیا آپ اس مختص شدہ مواد کو حذف کرنا چاہتے ہیں؟',
			'    studentmode.        no': ' نہيں',
			'    studentmode.        yes': ' ہاں',
			'    managestudents.        managestudents': '  طلباء کا انتظام کریں',
			'    managestudents.        search': ' تلاش',
			'    managestudents.        notfound': ' کوئی نتائج نہیں ملے',
			'    managestudents.        addnew': ' نیا طالب علم شامل کریں',
			'    managestudents.        age': ' عمر',
			'    managestudents.        cancel': ' منسوخ',
			'    managestudents.        submit': ' جمع کرائیں',
			'    managestudents.        name': ' طالب علم کا نام',
			'    managestudents.        editstudent': ' طالب علم کی تفصیلات تدوین کریں',
			'    managestudents.        deletestudent': ' طالب علم کی تفصیلات حذف کریں',
			'    managestudents.        deletestudentwarning': ' کیا آپ اس بچے کے ریکارڈ حذف کرنا چاہتے ہیں؟',
			'    managestudents.        delete': ' مٹانا',
			'    managestudents.        gat': ' گیٹ',
			'    managestudents.        studentadded': ' طالب علم کو کامیابی سے شامل کیا گیا ہے',
			'    allocatecontent.        allocatecontent': ' مواد مختص کریں',
			'    allocatecontent.        selectgat': ' گٹ منتخب کریں',
			'    allocatecontent.        selecttopic': ' موضوع منتخب کریں',
			'    allocatecontent.        selectvideos': ' ویڈیوز منتخب کریں',
			'    allocatecontent.        selectedvideos': ' منتخب ویڈیوز',
			'    allocatecontent.        dateofcontent': ' مشمول مختص کرنے کے لیے براہ کرم تاریخ منتخب کریں',
			'    allocatecontent.        selectdate': ' تاریخ منتخب کریں',
			'    takeattendance.        takeattendance': ' حاضری لیں',
			'    takeattendance.        date': ' تاریخ',
			'    takeattendance.        dashboard': ' ڈیش بورڈ',
			'    takeattendance.        selectgat': ' براہ کرم ایک گیٹ منتخب کریں',
			'    takeattendance.        selectdate': ' تاریخ منتخب کریں',
			'    takeattendance.        save': ' بچانا',
			'    takeattendance.        attendancenottaken': ' حاضری نہیں لی گئی',
			'    takeattendance.        nostudent': ' اس گیٹ کے لئے کوئی طالب علم رجسٹر نہیں ہے!',
			'    takeattendance.        holiday': ' آج چھٹی ہے',
			'    takeattendance.confirmattendance': 'حاضری کی تصدیق کریں',
			'    takeattendance.confirmwarning': 'براہ کرم تصدیق کریں کہ آپ یہ حاضری جمع کرانا چاہتے ہیں',
			'    takeattendance.cancel': 'منسوخ',
			'    takeattendance.ok': 'ٹھيک ہے',
			'    takeattendance.attendancetaken': 'حاضری پہلے ہی لی گئی ہے',
			'    takeattendance.takenwarning': 'آپ آج اس گیٹ کے لئے حاضری لے چکے ہیں',
			'    review.        review': ' جائزہ',
			'    review.        selectmonth': ' مہینہ منتخب کریں',
			'    review.        selectgat': ' براہ کرم ایک گیٹ منتخب کریں',
			'    review.        attendancereview': ' حاضری کا جائزہ',
			'    review.        quizreview': ' کوئز جائزہ',
			'    review.        videoprog': ' ویڈیو پیش رفت',
			'    review.        selectstudent': ' براہ کرم طالب علم منتخب کریں',
			'    review.        nodata': ' منتخب قطعات کے لیے دکھانے کے لیے کوائف نہیں',
			'    review.        noquizgiven': ' کوئی کوئز نہیں دیا گیا',
			'    review.        videono': ' ویڈیو نمبر',
			'    review.        topic': ' موضوع',
			'    review.        duration': ' دورانیہ',
			'    review.        progress': ' ارتقا',
			'    review.        noattendance': ' حاضری نہیں لی گئی',
			'    assessment.        createquiz': '  کوئز بنائیں',
			'    assessment.        createqs': ' سوالات بنائیں',
			'    assessment.        createqzs': ' کوئز بنائیں',
			'    assessment.        allqzs': ' تمام کوئز',
			'    assessment.        giveqz': ' کوئز دیں',
			'    assessment.        selectgat': ' گٹ منتخب کریں',
			'    assessment.        selecttopic': ' موضوع منتخب کریں',
			'    assessment.        enterq': ' سوال درج کریں',
			'    assessment.        enteroptiona': ' اختیار داخل کریں اے',
			'    assessment.        enteroptionb': ' اختیار بی درج کریں',
			'    assessment.        enteroptionc': ' اختیار سی درج کریں',
			'    assessment.        enteroptiond': ' اختیار ڈی درج کریں',
			'    assessment.        choosea': ' جواب منتخب کریں',
			'    assessment.        optiona': ' اختیار اے',
			'    assessment.        optionb': ' آپشن بی',
			'    assessment.        optionc': ' اختیار سی',
			'    assessment.        optiond': ' آپشن ڈی ',
			'    assessment.        selectqs': '    سوالات منتخب کریں   ',
			'    assessment.        selectatleastoneq': ' براہ کرم کم از کم ایک سوال منتخب کریں',
			'    assessment.        noqs': ' دکھانے کے لیے کوئی سوال نہیں',
			'    assessment.        makequizwarning': ' کیا آپ کو یقین ہے کہ آپ منتخب سوالات میں سے ایک کوئز بنانا چاہتے ہیں؟',
			'    assessment.        selectdate': ' تاریخ منتخب کریں',
			'    assessment.        qztime': ' کل کوئز وقت',
			'    assessment.        cancel': ' منسوخ',
			'    assessment.        qzcreated': ' کوئز کامیابی سے بنایا گیا ہے',
			'    assessment.        noqzs': ' دکھانے کے لئے کوئی کوئز !!',
			'    assessment.        selectqz': ' کوئز منتخب کریں',
			'    assessment.        listogqzs': ' فہرست تمام کوئز',
			'    assessment.        noqzsmade': ' ابھی تک کوئی کوئز نہیں بنایا گیا',
			'    assessment.        gat': ' گیٹ ',
			'    assessment.        date': 'تاریخ ',
			'    assessment.        deleteqzs': ' کوئز حذف کریں',
			'    assessment.        deleteqzwarning': ' کیا آپ کو یقین ہے کہ آپ اس مختص کوئز کو حذف کرنا چاہتے ہیں؟',
			'    assessment.ok': 'ٹھيک ہے',
		};
	}
}
