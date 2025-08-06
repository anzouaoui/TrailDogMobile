import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ActivityPage
  {
    'yp372g23': {
      'en': 'Activity Details',
      'fr': 'Détails de l\'activité',
    },
    '9bdvjpst': {
      'en': 'NOTES',
      'fr': 'NOTES',
    },
    'ddcjvu7i': {
      'en': 'Add comment',
      'fr': 'Ajouter un commentaire',
    },
    'tcbxwj6a': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // EditProfilPage
  {
    'fgxfefg6': {
      'en': 'Edit Profile',
      'fr': 'Modifier le profil',
    },
    'btvf9s84': {
      'en': 'Name',
      'fr': 'Nom',
    },
    'iwk20bnz': {
      'en': 'Firstname',
      'fr': 'Prénom',
    },
    'lokc8hs6': {
      'en': 'Bio',
      'fr': 'Biographie',
    },
    '5n0m6j2v': {
      'en': '28/160',
      'fr': '28/160',
    },
    '5chyexcr': {
      'en': 'Location',
      'fr': 'Emplacement',
    },
    'q5j6ib2t': {
      'en': 'Preferred Activity',
      'fr': 'Activité préférée',
    },
    'sqq407i9': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    'k5j3x2vi': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'cikpixjv': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'w34sdehd': {
      'en': 'Option 2',
      'fr': 'Option 2',
    },
    'crmzf5vf': {
      'en': 'Option 3',
      'fr': 'Option 3',
    },
    '224bkhei': {
      'en': 'Save Profile',
      'fr': 'Enregistrer le profil',
    },
    '6anr31ir': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // PerformancePage
  {
    '1v2fbx63': {
      'en': 'Performance',
      'fr': 'Performance',
    },
    'hp25tlxa': {
      'en': 'Me',
      'fr': 'Moi',
    },
    'eiidx4g4': {
      'en': 'Bella',
      'fr': 'Belle',
    },
    'c8weplk0': {
      'en': 'Max',
      'fr': 'Max',
    },
    '4e3y6j1y': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ProfilPage
  {
    '5to2vrx8': {
      'en': 'My dogs',
      'fr': 'Mes chiens',
    },
    'l7zam4e5': {
      'en': 'Friends',
      'fr': 'Amis',
    },
    'nfj97rpa': {
      'en': 'Rewards',
      'fr': 'Badges',
    },
    'eh2h9ogt': {
      'en': 'Stats',
      'fr': 'Statistiques',
    },
    'vg4hd24h': {
      'en': 'Add a new dog',
      'fr': 'Ajouter un nouveau chien',
    },
    '163tp1dk': {
      'en': 'Add a new friend',
      'fr': 'Ajouter un nouvel ami',
    },
    'yic5ah6k': {
      'en': 'Profile',
      'fr': 'Profil',
    },
  },
  // CreateProfilePage
  {
    'i2ky9erq': {
      'en': 'Create runner profile',
      'fr': 'Créer un profil de coureur',
    },
    '8rjh8ivy': {
      'en': 'Firstname',
      'fr': 'Prénom',
    },
    '5si88i0n': {
      'en': 'Your firstname',
      'fr': 'Votre prénom',
    },
    'o7do2ps9': {
      'en': 'Lastname',
      'fr': 'Nom de famille',
    },
    'h4h1q1qj': {
      'en': 'Your Name',
      'fr': 'Votre nom',
    },
    '59jco6iz': {
      'en': 'City',
      'fr': 'Ville',
    },
    '90klzs78': {
      'en': 'Your City',
      'fr': 'Votre ville',
    },
    'uopupsv0': {
      'en': 'Main activity',
      'fr': 'Activité principale',
    },
    'xsoc3fhh': {
      'en': 'Cani-cross',
      'fr': 'Cani-cross',
    },
    '83b2b1l2': {
      'en': 'Select activity',
      'fr': 'Sélectionnez l\'activité',
    },
    'i6kjxumr': {
      'en': 'Cani-cross',
      'fr': 'Cani-cross',
    },
    'zbkxyaya': {
      'en': 'cani-VTT',
      'fr': 'cani-VTT',
    },
    'xvigpsta': {
      'en': 'cani-hicking',
      'fr': 'cani-randonnée',
    },
    'wskwf6n0': {
      'en': 'Bio',
      'fr': 'Biographie',
    },
    'zkhv17c4': {
      'en': 'Your bio',
      'fr': 'Votre biographie',
    },
    'll34a27q': {
      'en': 'Gender',
      'fr': 'Genre',
    },
    '3s0oz8bg': {
      'en': 'other',
      'fr': 'autre',
    },
    'nivhuwwj': {
      'en': 'Select gender',
      'fr': 'Sélectionnez le sexe',
    },
    '0j5zvawy': {
      'en': 'man',
      'fr': 'homme',
    },
    'i61n3789': {
      'en': 'woman',
      'fr': 'femme',
    },
    'uo657v36': {
      'en': 'other',
      'fr': 'autre',
    },
    'z3tp3fhb': {
      'en': 'Weight (kg)',
      'fr': 'Poids (kg)',
    },
    '9vlj86oc': {
      'en': 'Your weight',
      'fr': 'Votre poids',
    },
    'yz33ax9m': {
      'en': 'resting heart rate (bpm)',
      'fr': 'fréquence cardiaque au repos (bpm)',
    },
    'zdddocr2': {
      'en': 'Your heatbeat',
      'fr': 'Votre rythme cardiaque',
    },
    'qawos02j': {
      'en': 'Continue and add a dog',
      'fr': 'Continuer et ajouter un chien',
    },
  },
  // HomePage
  {
    'zop54nca': {
      'en': 'Actulaities',
      'fr': 'Actualités',
    },
    '0t54q516': {
      'en': 'Add a post',
      'fr': 'Ajouter une publication',
    },
    'ouxrrhs0': {
      'en': 'Upcoming Challenges',
      'fr': 'Défis à venir',
    },
    '9z90dnjq': {
      'en': 'Summer Trail Challenge',
      'fr': 'Défi Trail d\'été',
    },
    'okp01lld': {
      'en': 'Complete 50km in the next 14 days',
      'fr': 'Complétez 50 km dans les 14 prochains jours',
    },
    '50e7vxyn': {
      'en': '23 participants',
      'fr': '23 participants',
    },
    '7kaoewry': {
      'en': 'Join Now',
      'fr': 'Rejoignez-nous maintenant',
    },
    '7rry0wff': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // EditProfilDogPage
  {
    'r26baffh': {
      'en': 'Dog Name',
      'fr': 'Nom du chien',
    },
    '6bln8gfq': {
      'en': 'Max',
      'fr': 'Max',
    },
    'd45le66n': {
      'en': 'Breed',
      'fr': 'Race',
    },
    'po75ju37': {
      'en': '',
      'fr': '',
    },
    'zp90zlp9': {
      'en': 'Gender',
      'fr': 'Genre',
    },
    '3n68vkya': {
      'en': 'Male',
      'fr': 'Mâle',
    },
    '6heze2wc': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    'z8kt8xo1': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    '64b53xdg': {
      'en': 'Male',
      'fr': 'Mâle',
    },
    '6pkcuc58': {
      'en': 'Female',
      'fr': 'Femelle',
    },
    'nq9rz26j': {
      'en': 'Age',
      'fr': 'Âge',
    },
    'pimb5lph': {
      'en': '',
      'fr': '',
    },
    'eyptjt1e': {
      'en': 'Weight (kg)',
      'fr': 'Poids (kg)',
    },
    'zbf3xifm': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    'odk4lbwq': {
      'en': 'Preferred activity',
      'fr': 'Activité préférée',
    },
    'flbv22t1': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    'k8zaztnv': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'lj3rwe7e': {
      'en': 'Canicross',
      'fr': 'Canicross',
    },
    '33d73zvm': {
      'en': 'Cani-VTT',
      'fr': 'Cani-VTT',
    },
    '53lqy1v7': {
      'en': 'Cani hiking',
      'fr': 'Cani-randonnée',
    },
    'l6c1exuu': {
      'en': 'Experience Level',
      'fr': 'Niveau d\'expérience',
    },
    'oqfmiayp': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    '04krflwy': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    '6csvs37b': {
      'en': 'Beginner',
      'fr': 'Débutant',
    },
    'ezbbt35w': {
      'en': 'Intermediate',
      'fr': 'Intermédiaire',
    },
    '18fgialz': {
      'en': 'Advanced',
      'fr': 'Avancé',
    },
    'kwu19j4s': {
      'en': 'Professional',
      'fr': 'Professionnel',
    },
    'bvhn3qrx': {
      'en': 'health information',
      'fr': 'informations sur la santé',
    },
    'ok252ojb': {
      'en': 'TextField',
      'fr': '',
    },
    '5i9d63ze': {
      'en': 'Chip/tattoo',
      'fr': 'Puce/tatouage',
    },
    'hzs0cf8v': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    'lcsbcbxc': {
      'en': 'Update',
      'fr': 'Mise à jour',
    },
    'zq7dj9zr': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // DogsPage
  {
    '7fkip3sh': {
      'en': 'My dogs',
      'fr': 'Mes chiens',
    },
    'tjfqhbib': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // LoginPage
  {
    'a4sc25p8': {
      'en': 'Welcome Back',
      'fr': 'Content de te revoir',
    },
    '85ljcaw4': {
      'en': 'Sign in to continue your adventure with your canine friend',
      'fr': 'Connectez-vous pour continuer votre aventure avec votre ami canin',
    },
    '1zws82x6': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'ed86x6w6': {
      'en': 'you@example.com',
      'fr': 'vous@exemple.com',
    },
    '0qad40hc': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'davd5yds': {
      'en': 'Forgot password?',
      'fr': 'Mot de passe oublié?',
    },
    '0unzf4md': {
      'en': '••••••••',
      'fr': '••••••••',
    },
    'mnzrsocz': {
      'en': 'Sign in',
      'fr': 'Se connecter',
    },
    '4id3y1a8': {
      'en': 'Or continue with',
      'fr': 'Ou continuez avec',
    },
    'c4i9ffix': {
      'en': 'Google',
      'fr': 'Google',
    },
    'emqr5ibu': {
      'en': 'Apple',
      'fr': 'Apple',
    },
    'oain97kp': {
      'en': 'Don\'t have an account?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'qdwdf63o': {
      'en': 'Sign up',
      'fr': 'S\'inscrire',
    },
    'atl1kxfn': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // SettingsPage
  {
    'lfe6uqti': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
    'w1luj9cr': {
      'en': 'Fonctionnalités Premium',
      'fr': 'Fonctionnalités Premium',
    },
    'prlojj22': {
      'en': 'Health Records',
      'fr': 'dossiers de santé',
    },
    '26zkln6j': {
      'en': 'Complete health monitoring, vaccinations and veterinary reports',
      'fr': 'Suivi sanitaire complet, vaccinations et rapports vétérinaires',
    },
    'x969wjez': {
      'en': 'Advanced Analytics',
      'fr': 'Analyse avancée',
    },
    '3ywjq54d': {
      'en': 'Interactive charts and detailed performance insights',
      'fr':
          'Graphiques interactifs et informations détaillées sur les performances',
    },
    'm3sch6ua': {
      'en': 'Device Integration',
      'fr': 'Intégration des appareils',
    },
    'fz7gapxc': {
      'en': 'Connect smartwatches and GPS trackers',
      'fr': 'Connectez les montres connectées et les traceurs GPS',
    },
    'kew81rzh': {
      'en': 'Manage Subscription',
      'fr': 'Gérer l\'abonnement',
    },
    '1d9yxwsn': {
      'en': 'Check your premium plan and billing',
      'fr': 'Vérifiez votre forfait premium et votre facturation',
    },
    'qcv0xfqq': {
      'en': 'Account',
      'fr': 'Compte',
    },
    'pldgtwzq': {
      'en': 'Profile Settings',
      'fr': 'Paramètres du profil',
    },
    'l5iixmib': {
      'en': 'Change your personal information',
      'fr': 'Modifiez vos informations personnelles',
    },
    'k0xoaul9': {
      'en': 'Dog Profiles',
      'fr': 'Profils de chiens',
    },
    '4jjkiu8k': {
      'en': 'Manage your dogs\' information',
      'fr': 'Gérez les informations de vos chiens',
    },
    'j9eoiz9b': {
      'en': 'Notifications',
      'fr': 'Notifications',
    },
    'c2fm6e8u': {
      'en': 'Configure your notification preferences',
      'fr': 'Configurez vos préférences de notification',
    },
    'l0gykr0h': {
      'en': 'Applications',
      'fr': 'Applications',
    },
    'cnkufmnm': {
      'en': 'Manage Google Fit or Apple Health apps',
      'fr': 'Gérer les applications Google Fit ou Apple Health',
    },
    'h1oljsf7': {
      'en': 'App Settings',
      'fr': 'Paramètres de l\'application',
    },
    'tt3aw9d1': {
      'en': 'Privacy and Security',
      'fr': 'Confidentialité et sécurité',
    },
    't9denwbs': {
      'en': 'Manage your privacy and security settings',
      'fr': 'Gérez vos paramètres de confidentialité et de sécurité',
    },
    'r2mjmus5': {
      'en': 'Messages',
      'fr': 'Messages',
    },
    'iw0eowpz': {
      'en': 'Chat and Communication Settings',
      'fr': 'Paramètres de chat et de communication',
    },
    'ps9gky0q': {
      'en': 'Support',
      'fr': 'Soutien',
    },
    'z7feuw0d': {
      'en': 'Help and support',
      'fr': 'Aide et support',
    },
    'o4r1lgh7': {
      'en': 'Get help and contact support',
      'fr': 'Obtenez de l\'aide et contactez le support',
    },
    'nsdgkdym': {
      'en': 'Logout',
      'fr': 'Déconnexion',
    },
    '4edce3gm': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // CreateProfilDogPage
  {
    'njmk04ej': {
      'en': 'Add Dog',
      'fr': 'Ajouter un chien',
    },
    'ldv06uuk': {
      'en': 'Dog Name',
      'fr': 'Nom du chien',
    },
    'pv4aa7kr': {
      'en': 'Max',
      'fr': 'Max',
    },
    '6a2jyumw': {
      'en': 'Breed',
      'fr': 'Race',
    },
    '21v0b4fi': {
      'en': 'Golden Retriever',
      'fr': 'Golden Retriever',
    },
    'qjs75u45': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    'jthg25em': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'pdo05kta': {
      'en': 'Other breed',
      'fr': 'Autre race',
    },
    'nhw8t9c6': {
      'en': '',
      'fr': '',
    },
    'zestjl4t': {
      'en': 'Gender',
      'fr': 'Genre',
    },
    'wcl06qyw': {
      'en': 'Male',
      'fr': 'Mâle',
    },
    'gg8p3y8p': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    '7i8oxywk': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'uvgmp3ou': {
      'en': 'Male',
      'fr': 'Mâle',
    },
    'l2qt8i1w': {
      'en': 'Female',
      'fr': 'Femelle',
    },
    's0538zcq': {
      'en': 'Age',
      'fr': 'Âge',
    },
    'wzzxoo01': {
      'en': '',
      'fr': '',
    },
    '2ij1j5iy': {
      'en': 'Weight (kg)',
      'fr': 'Poids (kg)',
    },
    'be6htbht': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    'ldcvckn9': {
      'en': 'Preferred activity',
      'fr': 'Activité préférée',
    },
    'jnceov7i': {
      'en': 'Canicross',
      'fr': 'Canicross',
    },
    '9ycae349': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    'b365wzdt': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    '31rlo7zg': {
      'en': 'Canicross',
      'fr': 'Canicross',
    },
    'fymg3znb': {
      'en': 'Cani-VTT',
      'fr': 'Cani-VTT',
    },
    'octuqnz2': {
      'en': 'Cani hiking',
      'fr': 'Cani-randonnée',
    },
    'o8ilh400': {
      'en': 'Experience Level',
      'fr': 'Niveau d\'expérience',
    },
    'pdfn10n4': {
      'en': 'Beginner',
      'fr': 'Débutant',
    },
    'h5hns6np': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    '8i29gg9f': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'fb6xln6i': {
      'en': 'Beginner',
      'fr': 'Débutant',
    },
    'gle1ddiu': {
      'en': 'Intermediate',
      'fr': 'Intermédiaire',
    },
    'qfftgfu9': {
      'en': 'Advanced',
      'fr': 'Avancé',
    },
    'y0ycb13w': {
      'en': 'Professional',
      'fr': 'Professionnel',
    },
    'b9bjqup2': {
      'en': 'health information',
      'fr': 'informations sur la santé',
    },
    'xq049vc1': {
      'en': 'TextField',
      'fr': '',
    },
    '6yl0p9hq': {
      'en': 'Chip/tattoo',
      'fr': 'Puce/tatouage',
    },
    'qxga9ure': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    'nbtpyidk': {
      'en': 'Add',
      'fr': 'Ajouter',
    },
    '1n2uj92n': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // MessagesPage
  {
    '9dbg07jx': {
      'en': 'Mesages',
      'fr': 'Messages',
    },
    'ztloyq4r': {
      'en': 'Search',
      'fr': 'Recherche',
    },
    'bymr4fxo': {
      'en': 'Messages',
      'fr': 'Messages',
    },
  },
  // OnboardingPage
  {
    'hz31u204': {
      'en': 'Move with your dog like never before!',
      'fr': 'Bougez avec votre chien comme jamais auparavant !',
    },
    'l3qiwx3a': {
      'en': 'Next',
      'fr': 'Suivant',
    },
    '0nq0xefy': {
      'en':
          'Track your performance and the health of your human-dog duo in real time',
      'fr':
          'Suivez vos performances et la santé de votre duo humain-chien en temps réel',
    },
    'm2yrupuk': {
      'en': 'Next',
      'fr': 'Suivant',
    },
    's1z3azwk': {
      'en':
          'Join a passionate community and experience the TrailDog adventure!',
      'fr':
          'Rejoignez une communauté passionnée et vivez l\'aventure TrailDog !',
    },
    'yjsef1ap': {
      'en': 'Sign up',
      'fr': 'S\'inscrire',
    },
    'y82sdcs2': {
      'en': 'Log in',
      'fr': 'Se connecter',
    },
    'wqhriavi': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // SignUpPage
  {
    'f9767mkl': {
      'en': 'Sign up',
      'fr': 'S\'inscrire',
    },
    'pmb1as5x': {
      'en': 'Join our community of dog sports enthusiasts',
      'fr': 'Rejoignez notre communauté de passionnés de sports canins',
    },
    'sodon42m': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'y7h143xt': {
      'en': 'you@example.com',
      'fr': 'vous@exemple.com',
    },
    'k4mjgy5g': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'quh03zwu': {
      'en': '••••••••',
      'fr': '••••••••',
    },
    'zr9on3cv': {
      'en': 'Confirme Password',
      'fr': 'Confirmer le mot de passe',
    },
    'g3zd1z7c': {
      'en': '••••••••',
      'fr': '••••••••',
    },
    'hkxpks1v': {
      'en': 'accept the ',
      'fr': 'accepter les ',
    },
    'p66j5q6c': {
      'en': 'Terms of Service ',
      'fr': 'Conditions d\'utilisation ',
    },
    'bwumualg': {
      'en': ' and ',
      'fr': 'et ',
    },
    'idpvhsy9': {
      'en': 'Privacy Policy',
      'fr': 'politique de confidentialité',
    },
    'xpp7ecs3': {
      'en': 'Create account',
      'fr': 'Créer un compte',
    },
    'y308o36p': {
      'en': 'Or continue with',
      'fr': 'Ou continuez avec',
    },
    'r5vygmrx': {
      'en': 'Google',
      'fr': 'Google',
    },
    '5p8ay445': {
      'en': 'Apple',
      'fr': 'Apple',
    },
    'liuqs1uu': {
      'en': 'Already have an account? ',
      'fr': 'Vous avez déjà un compte ?',
    },
    '8rx179ov': {
      'en': 'Sign in',
      'fr': 'Se connecter',
    },
    'ynr1fz2x': {
      'en': 'Hom',
      'fr': 'Hom',
    },
  },
  // TrackPage
  {
    'ua5fgffo': {
      'en': 'Activity type',
      'fr': 'Type d\'activité',
    },
    '0615kgnp': {
      'en': 'Cani-cross',
      'fr': 'Cani-cross',
    },
    'qdk2ug1q': {
      'en': 'Select...',
      'fr': 'Sélectionner...',
    },
    '162khp0x': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    '21jlffn7': {
      'en': 'Cani-cross',
      'fr': 'Cani-cross',
    },
    'kbhoxshy': {
      'en': 'Cani-VTT',
      'fr': 'Cani-VTT',
    },
    'v5n1jcpa': {
      'en': 'Cani-hicking',
      'fr': 'Cani-randonnée',
    },
    'n3jand5o': {
      'en': 'Dogs',
      'fr': 'Chiens',
    },
    '1br0go0w': {
      'en': 'Activity statistics',
      'fr': 'Statistiques d\'activité',
    },
    '4figyzpf': {
      'en': 'Distance',
      'fr': 'Distance',
    },
    'dtz5vjq5': {
      'en': 'Speed',
      'fr': 'Vitesse',
    },
    '6hbhov8g': {
      'en': 'Steps',
      'fr': 'Pas',
    },
    'nn4ktvc1': {
      'en': 'Height difference',
      'fr': 'Dénivelé',
    },
    '5k5lgd50': {
      'en': 'Timer',
      'fr': 'Minuteur',
    },
    'cde2pubn': {
      'en': 'Start recording',
      'fr': 'Démarrer l\'enregistrement',
    },
    '9spuyv02': {
      'en': 'Pause',
      'fr': 'Pause',
    },
    'nxmhw3dw': {
      'en': 'Resume',
      'fr': 'Reprendre',
    },
    '8s5w3s9h': {
      'en': 'Stop',
      'fr': 'Arrêt',
    },
    '76bfdebb': {
      'en': 'Save activity',
      'fr': 'Chiens de santé',
    },
    'fec3lrvk': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // AskFriendPage
  {
    'nikxwve2': {
      'en': 'Friend requests',
      'fr': 'Demandes d\'amis',
    },
    'mxcti0wo': {
      'en': 'Search...',
      'fr': 'Recherche...',
    },
    'hpowvbyf': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    '5cj6uve4': {
      'en': '',
      'fr': '',
    },
    'i1qkxtle': {
      'en': 'Runners',
      'fr': 'Coureurs',
    },
  },
  // FriendsPage
  {
    'r5p9kb47': {
      'en': 'My friends',
      'fr': 'Mes amis',
    },
    'v2hbtdz8': {
      'en': 'Thomas Martin',
      'fr': 'Thomas Martin',
    },
    'gta9uh4d': {
      'en': '@thomas_run',
      'fr': '@thomas_run',
    },
    'xu1k92a8': {
      'en': 'Sophie Laurent',
      'fr': 'Sophie Laurent',
    },
    'njf1ldjw': {
      'en': '@sophie_fit',
      'fr': '@sophie_fit',
    },
    '6xln62wr': {
      'en': 'Lucas Moreau',
      'fr': 'Lucas Moreau',
    },
    '1kvaw1qx': {
      'en': '@lucas_bike',
      'fr': '@lucas_bike',
    },
    'l61ei5yc': {
      'en': 'Emma Rousseau',
      'fr': 'Emma Rousseau',
    },
    'k56gqtuh': {
      'en': '@emma_yoga',
      'fr': '@emma_yoga',
    },
    'b4f999z1': {
      'en': 'Antoine Leroy',
      'fr': 'Antoine Leroy',
    },
    'j0ebcryk': {
      'en': '@antoine_swim',
      'fr': '@antoine_swim',
    },
    'lfiqjksl': {
      'en': 'Camille Petit',
      'fr': 'Camille Petit',
    },
    'og5ocroj': {
      'en': '@camille_tennis',
      'fr': '@camille_tennis',
    },
    'de9trdrj': {
      'en': 'Requests sent',
      'fr': 'Demandes envoyées',
    },
    'ek5919r9': {
      'en': 'Research new friends',
      'fr': 'Recherchez de nouveaux amis',
    },
  },
  // NotificationPage
  {
    'gbhdjmlx': {
      'en': 'Notifications',
      'fr': 'Notifications',
    },
  },
  // ChatViewPage
  {
    'kzp80tsq': {
      'en': 'En ligne',
      'fr': 'En ligne',
    },
    '2ggo0qrj': {
      'en': '14:35',
      'fr': '14:35',
    },
    '8buzrntb': {
      'en': 'Tapez votre message...',
      'fr': 'Tapez votre message...',
    },
  },
  // ActivitiesPage
  {
    'i6hoavkh': {
      'en': 'Activity Feed',
      'fr': 'Flux d\'activité',
    },
    'l9hlspr3': {
      'en': 'Upcoming Challenges',
      'fr': 'Défis à venir',
    },
    'v5omu7hx': {
      'en': 'Summer Trail Challenge',
      'fr': 'Défi Trail d\'été',
    },
    'rxodndxw': {
      'en': 'Complete 50km in the next 14 days',
      'fr': 'Complétez 50 km dans les 14 prochains jours',
    },
    'ytna48tx': {
      'en': '23 participants',
      'fr': '23 participants',
    },
    'isqubn7t': {
      'en': 'Join Now',
      'fr': 'Rejoignez-nous maintenant',
    },
    'ywkdao87': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // NewPostPage
  {
    'gj4i4o0v': {
      'en': 'New post',
      'fr': 'Nouveau message',
    },
    '86rw9izy': {
      'en': 'Quoi de neuf ?',
      'fr': 'Quoi de neuf ?',
    },
    'zbhqdate': {
      'en': 'Photo/Vidéo',
      'fr': 'Photo/Vidéo',
    },
    'w0w0ju8u': {
      'en': 'Activité',
      'fr': 'Activité',
    },
    'r9av8aka': {
      'en': 'Publish',
      'fr': 'Publier',
    },
  },
  // NotificationSettingsPage
  {
    '705t58az': {
      'en': 'Paramètres de Notification',
      'fr': 'Paramètres de notification',
    },
    'f1umwqrq': {
      'en': 'Catégories de Notifications',
      'fr': 'Catégories de notifications',
    },
    '2f6dx6og': {
      'en': 'Messages',
      'fr': 'Messages',
    },
    'lbxwq6yg': {
      'en': 'Notifications pour nouveaux messages et discussions de groupe',
      'fr': 'Notifications pour nouveaux messages et discussions de groupe',
    },
    'd7as5i7w': {
      'en': 'Rappels Santé',
      'fr': 'Rappels Santé',
    },
    'gdogoa9t': {
      'en': 'Rappels de vaccination et alertes santé',
      'fr': 'Rappels de vaccination et alertes santé',
    },
    '1fsk5tka': {
      'en': 'Accomplissements',
      'fr': 'Réalisations',
    },
    'ge5gj5sh': {
      'en': 'Badges, jalons et accomplissements',
      'fr': 'Insignes, jalons et réalisations',
    },
    'nrbdx63a': {
      'en': 'Interactions Sociales',
      'fr': 'Interactions sociales',
    },
    'l1jyirwy': {
      'en': 'J\'aime, commentaires et mentions',
      'fr': 'J\'aime, commentaires et mentions',
    },
    '09cclq9c': {
      'en': 'Événements',
      'fr': 'Événements',
    },
    'slv2f7xx': {
      'en': 'Événements et activités à venir',
      'fr': 'Événements et activités à venir',
    },
    'pvyoveoa': {
      'en': 'Paramètres Généraux',
      'fr': 'Paramètres Généraux',
    },
    'bzg4n3gk': {
      'en': 'Notifications Push',
      'fr': 'Notifications Push',
    },
    'sbd21ajf': {
      'en': 'Recevoir des notifications sur votre appareil',
      'fr': 'Recevoir des notifications sur votre appareil',
    },
    'z8g1pkma': {
      'en': 'Notifications Email',
      'fr': 'Notifications par e-mail',
    },
    'o9lia543': {
      'en': 'Recevoir des résumés et alertes par email',
      'fr': 'Recevoir des CV et alertes par email',
    },
    'vis9763m': {
      'en': 'Ne Pas Déranger',
      'fr': 'Ne Pas Déranger',
    },
    'dpakzp4o': {
      'en': 'Couper temporairement toutes les notifications',
      'fr': 'Couper temporairement toutes les notifications',
    },
    'nbky6tk3': {
      'en': 'Sauvegarder les Préférences',
      'fr': 'Sauvegarder les Préférences',
    },
    'sxfjnn2g': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ApplicationsPage
  {
    '50t69aec': {
      'en': 'notifications settings',
      'fr': 'paramètres de notifications',
    },
    'np9jj0ou': {
      'en': 'Health Sync',
      'fr': 'Synchronisation de la santé',
    },
    'i45edz4a': {
      'en':
          'Connect your health data for automatic tracking of your physical activity.',
      'fr':
          'Connectez vos données de santé pour un suivi automatique de votre activité physique.',
    },
    'jruvu4in': {
      'en': 'Google Fit',
      'fr': 'Google Fit',
    },
    'ywf9kdji': {
      'en': 'Sync with Google Fit',
      'fr': 'Synchronisation avec Google Fit',
    },
    '5k9tewyv': {
      'en': 'Apple Health',
      'fr': 'Apple Santé',
    },
    'uwhqkede': {
      'en': 'Sync with Apple Health',
      'fr': 'Synchronisation avec Apple Health',
    },
    'uamh9vv0': {
      'en': 'Synchronisation automatique',
      'fr': 'Synchronisation automatique',
    },
    'yrjo7mfe': {
      'en':
          'Les données seront synchronisées automatiquement toutes les heures lorsque l\'application est ouverte.',
      'fr':
          'Les données seront synchronisées automatiquement toutes les heures lorsque l\'application est ouverte.',
    },
    '4xhzlvk6': {
      'en': 'Dernière synchronisation',
      'fr': 'Dernière synchronisation',
    },
    '0xc87gl1': {
      'en': 'Apple Health',
      'fr': 'Apple Santé',
    },
    'knzeg7np': {
      'en': 'Il y a 2 heures',
      'fr': 'Il y a 2 heures',
    },
    'sebpr6qz': {
      'en': 'Données synchronisées',
      'fr': 'Données synchronisées',
    },
    'wo0n8svf': {
      'en': '8 547 pas, 45 min d\'activité',
      'fr': '8 547 pas, 45 min d\'activité',
    },
    'j57rsz8g': {
      'en': 'Synchroniser maintenant',
      'fr': 'Synchroniser maintenant',
    },
    'mcz2t8tr': {
      'en': 'Information',
      'fr': 'Information',
    },
    'svuu0x2c': {
      'en':
          'La synchronisation peut prendre quelques minutes selon la quantité de données à traiter.',
      'fr':
          'La synchronisation peut prendre quelques minutes selon la quantité de données à traiter.',
    },
  },
  // DogHealthPage
  {
    'nu0206hu': {
      'en': 'Health Records',
      'fr': 'dossiers de santé',
    },
    'pzv7fuxf': {
      'en': 'Dogs',
      'fr': 'Chiens',
    },
    'rmjry5se': {
      'en': 'Select...',
      'fr': '',
    },
    'zu36nfr2': {
      'en': 'Search...',
      'fr': '',
    },
    'dmcyc10h': {
      'en': 'Option 1',
      'fr': '',
    },
    'q90oj38l': {
      'en': 'Option 2',
      'fr': '',
    },
    '6fhgf3q2': {
      'en': 'Option 3',
      'fr': '',
    },
    'wdbzpr9g': {
      'en': 'Vaccinations',
      'fr': 'Vaccinations',
    },
    '3s65qzcl': {
      'en': '5',
      'fr': '5',
    },
  },
  // DogAnalyticsPage
  {
    'vrupxs1i': {
      'en': 'Activity Analytics',
      'fr': 'Analyse des activités',
    },
    'v3nedr0y': {
      'en': 'Last 7 days',
      'fr': 'Les 7 derniers jours',
    },
    'i9h7io5x': {
      'en': 'Filter',
      'fr': 'Filtre',
    },
    '3oi472sv': {
      'en': 'Last 7 days',
      'fr': 'Les 7 derniers jours',
    },
    '2bjmyjo0': {
      'en': 'Last 30 days',
      'fr': 'Les 30 derniers jours',
    },
    'eq44de3l': {
      'en': 'Last 90 days',
      'fr': 'Les 90 derniers jours',
    },
    '20ydnso3': {
      'en': 'Summary',
      'fr': 'Résumé',
    },
    'uy98yo1p': {
      'en': '24.5',
      'fr': '24,5',
    },
    'ctsk67tz': {
      'en': 'Total Miles',
      'fr': 'Total des miles',
    },
    'wv1u5ljc': {
      'en': '3.5',
      'fr': '3,5',
    },
    'lecxpf6m': {
      'en': 'Avg/Day',
      'fr': 'Moy./jour',
    },
    '5a50uv5i': {
      'en': '6.2',
      'fr': '6.2',
    },
    'cje58476': {
      'en': 'Max Day',
      'fr': 'Journée Max',
    },
    'shm7xkur': {
      'en': 'Distance Walked',
      'fr': 'Distance parcourue',
    },
    'duqxjpaz': {
      'en': 'Line Chart',
      'fr': 'Graphique linéaire',
    },
    'q2s47kr7': {
      'en': 'Daily distance tracking',
      'fr': 'Suivi quotidien de la distance',
    },
    'hxdm5pjs': {
      'en': 'Buddy',
      'fr': 'Copain',
    },
    '5zvhuf2l': {
      'en': 'Luna',
      'fr': 'Lune',
    },
    'wikx08rg': {
      'en': 'Max',
      'fr': 'Max',
    },
    'vqg16p47': {
      'en': 'Activity Duration',
      'fr': 'Durée de l\'activité',
    },
    'xc9siai4': {
      'en': 'Bar Chart',
      'fr': 'Graphique à barres',
    },
    '4awqxvmr': {
      'en': 'Weekly activity duration',
      'fr': 'Durée de l\'activité hebdomadaire',
    },
    'd0kfb4d4': {
      'en': 'Mon',
      'fr': 'Lun',
    },
    'm0hv5mnj': {
      'en': 'Tue',
      'fr': 'Mar',
    },
    '83ry2mwy': {
      'en': 'Wed',
      'fr': 'Épouser',
    },
    'nxk8gv7v': {
      'en': 'Thu',
      'fr': 'Jeu',
    },
    '1ifxu5zw': {
      'en': 'Fri',
      'fr': 'Ven',
    },
    'oylw58x8': {
      'en': 'Sat',
      'fr': 'Assis',
    },
    'wh15cqgw': {
      'en': 'Sun',
      'fr': 'Soleil',
    },
    '542axde4': {
      'en': 'Activity Breakdown',
      'fr': 'Répartition des activités',
    },
    'n3wf33ro': {
      'en': 'Walking',
      'fr': 'Marche',
    },
    '87y0gywr': {
      'en': '18.2 miles',
      'fr': '18,2 milles',
    },
    'zhpta4wk': {
      'en': 'Running',
      'fr': 'En cours d\'exécution',
    },
    'ulzkb18i': {
      'en': '6.3 miles',
      'fr': '6,3 milles',
    },
    'qwjam0z2': {
      'en': 'Buddy',
      'fr': 'Copain',
    },
    'ij7dmb2b': {
      'en': 'Golden Retriever',
      'fr': 'Golden Retriever',
    },
    'zb5dahxi': {
      'en': '8.4 mi',
      'fr': '8,4 milles',
    },
    'ectkzicz': {
      'en': 'Today',
      'fr': 'Aujourd\'hui',
    },
    'chqn321n': {
      'en': 'Luna',
      'fr': 'Lune',
    },
    'skbnfi56': {
      'en': 'Border Collie',
      'fr': 'Border Collie',
    },
    'hm0fvjdc': {
      'en': '6.2 mi',
      'fr': '6,2 milles',
    },
    '8lkb2kg6': {
      'en': 'Today',
      'fr': 'Aujourd\'hui',
    },
    'jugs6k3y': {
      'en': 'Max',
      'fr': 'Max',
    },
    '5ahz1s26': {
      'en': 'German Shepherd',
      'fr': 'Berger allemand',
    },
    'zl1ske54': {
      'en': '9.9 mi',
      'fr': '9,9 milles',
    },
    'u1thom14': {
      'en': 'Today',
      'fr': 'Aujourd\'hui',
    },
  },
  // ActivityRatePage
  {
    '7bwwqskc': {
      'en': 'Rate Activity',
      'fr': 'Évaluer l\'activité',
    },
    '2hhmczhv': {
      'en': 'How was your experience?',
      'fr': 'Comment s\'est déroulée votre activité ?',
    },
    'q21e2q9o': {
      'en': 'Rate this activity to help other adventurers',
      'fr': 'Évaluez cette activité pour aider les autres aventuriers',
    },
    'k9u4v85b': {
      'en': 'Share your thoughts',
      'fr': 'Partagez vos pensées',
    },
    'omb5nap7': {
      'en':
          'Tell us about your experience... What did you enjoy most? Any tips for future participants?',
      'fr':
          'Parlez-nous de votre activité… Qu\'avez-vous le plus apprécié ? Des conseils pour les futurs participants ?',
    },
    '44bwpqdf': {
      'en': 'Submit Review',
      'fr': 'Soumettre un avis',
    },
  },
  // PaywallPage
  {
    'on5b6x22': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    '13dx609j': {
      'en': 'Becom a Premium trailer ',
      'fr': 'Devenez un trailer Premium',
    },
    '8fy83t4b': {
      'en': 'Advanced analytics : ',
      'fr': 'Analyses avancées : ',
    },
    'm6rm4or8': {
      'en': 'speed, elevation, and cadence charts',
      'fr': 'tableaux de vitesse, d\'élévation et de cadence',
    },
    'gfrnvqwh': {
      'en': 'Segments & leaderboards : ',
      'fr': 'Segments et classements : ',
    },
    'revwvd5i': {
      'en': 'automatic generation and ranking',
      'fr': 'génération et classement automatiques',
    },
    '9d411qio': {
      'en': 'Health alerts : ',
      'fr': 'Alertes sanitaires : ',
    },
    'qgzxepm9': {
      'en': 'custom thresholds and reminders for your dog',
      'fr': 'seuils et rappels personnalisés pour votre chien',
    },
    'jwqpse5m': {
      'en': 'AI recommendations : ',
      'fr': 'Recommandations de l\'IA : ',
    },
    '833kowf5': {
      'en': 'smart route suggestions',
      'fr': 'suggestions d\'itinéraires intelligents',
    },
    'key8ja4x': {
      'en': '  Personalized insights & suggestions :  ',
      'fr': 'Informations et suggestions personnalisées :',
    },
    '0qak866p': {
      'en': 'based on your activity',
      'fr': 'en fonction de votre activité',
    },
    'oxf36xb1': {
      'en': 'Device integration : ',
      'fr': 'Intégration des appareils :',
    },
    'iej6ofu7': {
      'en': 'connect GPS trackers and smartwatches',
      'fr': 'connecter les trackers GPS et les montres connectées',
    },
    'tmqnq7qy': {
      'en': 'Monthly',
      'fr': 'Mensuel',
    },
    'w9rnhrrf': {
      'en': '\$6.99 / month',
      'fr': '6,99 € / mois',
    },
    'ol6yj558': {
      'en': 'Buy',
      'fr': 'Acheter',
    },
  },
  // ForgotPasswordPage
  {
    'hdv83vy0': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
    },
    '5ac1ip9d': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'fr':
          'Nous vous enverrons un e-mail avec un lien pour réinitialiser votre mot de passe, veuillez saisir l\'e-mail associé à votre compte ci-dessous.',
    },
    'zmxiqv15': {
      'en': 'Your email address...',
      'fr': 'Votre adresse e-mail...',
    },
    'nasgs8ny': {
      'en': 'Enter your email...',
      'fr': '',
    },
    'o0fywjyj': {
      'en': 'Send Link',
      'fr': 'Envoyer le lien',
    },
    'c60tgicg': {
      'en': 'Home',
      'fr': '',
    },
  },
  // TermsOfUsePage
  {
    'hxvhc0rk': {
      'en': 'Terms of Use',
      'fr': 'Conditions d\'utilisation',
    },
    'z4vksbx4': {
      'en': 'Last updated: August  2025',
      'fr': 'Dernière mise à jour : août 2025',
    },
    'uy9evh3k': {
      'en':
          'Welcome to TrailDog! By using our mobile application, you agree to comply with the following Terms of Use. Please read them carefully.',
      'fr':
          'Bienvenue sur TrailDog ! En utilisant notre application mobile, vous acceptez les conditions d\'utilisation suivantes. Veuillez les lire attentivement.',
    },
    'rob688jf': {
      'en': '1. Purpose of the App',
      'fr': '1. Objectif de l\'application',
    },
    'v5x7rgmd': {
      'en':
          'TrailDog is a mobile application designed for dog owners to record, track, and share their outdoor activities (hiking, canicross, walking, etc.). Some features are only available through a premium subscription.',
      'fr':
          'TrailDog est une application mobile conçue pour les propriétaires de chiens, permettant d\'enregistrer, de suivre et de partager leurs activités de plein air (randonnée, canicross, promenade, etc.). Certaines fonctionnalités sont uniquement disponibles via un abonnement premium.',
    },
    'c6ttz9uo': {
      'en': '2. User Account',
      'fr': '2. Compte utilisateur',
    },
    '3tyihk2t': {
      'en':
          '• You must create an account to use TrailDog.\n• You are responsible for the accuracy of the information you provide.\n• You agree not to impersonate others or create fake accounts.',
      'fr':
          '• Vous devez créer un compte pour utiliser TrailDog.\n• Vous êtes responsable de l\'exactitude des informations que vous fournissez.\n• Vous vous engagez à ne pas vous faire passer pour quelqu\'un d\'autre ni à créer de faux comptes.',
    },
    'kx2663z5': {
      'en': '3. Respect and Safety',
      'fr': '3. Respect et sécurité',
    },
    'cynt7nhv': {
      'en':
          '• All shared content (text, photos, comments) must remain respectful and appropriate.\n• It is strictly forbidden to harass, threaten, or share offensive, discriminatory, or illegal content.\n• The TrailDog team reserves the right to delete inappropriate content or suspend accounts.',
      'fr':
          '• Tout contenu partagé (texte, photos, commentaires) doit rester respectueux et approprié.\n• Il est strictement interdit de harceler, de menacer ou de partager du contenu offensant, discriminatoire ou illégal.\n• L\'équipe TrailDog se réserve le droit de supprimer tout contenu inapproprié ou de suspendre un compte.',
    },
    'vdsxghou': {
      'en': '4. Activity Tracking and Health Data',
      'fr': '4. Suivi des activités et données de santé',
    },
    'bluz9vxm': {
      'en':
          '• TrailDog uses GPS tracking and, with your explicit consent, may access health data (heart rate, calories, etc.).\n• This data is used solely to improve your experience and will never be shared with third parties without your consent.',
      'fr':
          '• TrailDog utilise le suivi GPS et, avec votre consentement explicite, peut accéder à vos données de santé (fréquence cardiaque, calories, etc.).\n• Ces données sont utilisées uniquement pour améliorer votre expérience et ne seront jamais partagées avec des tiers sans votre consentement.',
    },
    'x624uyup': {
      'en': '5. Subscriptions and Premium Features',
      'fr': '5. Abonnements et fonctionnalités premium',
    },
    'vkpb3l3r': {
      'en':
          '• Some features (exclusive badges, health alerts, personalized route recommendations, etc.) require a paid subscription.\n• You can view and manage your subscription anytime through the App Store or Google Play',
      'fr':
          '• Certaines fonctionnalités (badges exclusifs, alertes santé, recommandations d\'itinéraires personnalisées, etc.) nécessitent un abonnement payant.\n• Vous pouvez consulter et gérer votre abonnement à tout moment via l\'App Store ou Google Play.',
    },
    'cf7x0nmg': {
      'en': '6. Intellectual Property',
      'fr': '6. Propriété intellectuelle',
    },
    '261jobwh': {
      'en':
          '• All content in the app (logos, illustrations, text, algorithms) is the property of TrailDog or its partners.\n• Any unauthorized reproduction or use is strictly prohibited.',
      'fr':
          '• L\'ensemble du contenu de l\'application (logos, illustrations, textes, algorithmes) est la propriété de TrailDog ou de ses partenaires.\n• Toute reproduction ou utilisation non autorisée est strictement interdite.',
    },
    '6iss7deo': {
      'en': '7. Liability',
      'fr': '7. Responsabilité',
    },
    'xjlash3c': {
      'en':
          '• You use the app at your own risk.\n• TrailDog cannot be held responsible for accidents, misinterpretation of data, or data loss.',
      'fr':
          '• Vous utilisez l\'application à vos propres risques.\n• TrailDog ne peut être tenu responsable des accidents, de la mauvaise interprétation des données ou de la perte de données.',
    },
    '0vf771v2': {
      'en': '8. Changes to the Terms',
      'fr': '8. Modifications des conditions',
    },
    '98mk75fw': {
      'en':
          'We reserve the right to modify these Terms of Use at any time. Any changes will be communicated via the app.',
      'fr':
          '• Vous utilisez l\'application à vos propres risques.\n• TrailDog ne peut être tenu responsable des accidents, de la mauvaise interprétation des données ou de la perte de données.',
    },
    'y1txr5dm': {
      'en': '9. Contact',
      'fr': '9. Contact',
    },
    'vslyeqea': {
      'en': 'For any questions, suggestions, or reports:',
      'fr': 'Pour toute question, suggestion ou signalement :',
    },
    'hws08f12': {
      'en': 'devmobflutterflow@gmail.com',
      'fr': 'devmobflutterflow@gmail.com',
    },
    'qvfem0pe': {
      'en':
          'By continuing to use this application, you acknowledge that you have read, understood, and agree to be bound by these Terms of Use.',
      'fr':
          'En continuant à utiliser cette application, vous reconnaissez avoir lu, compris et accepté d\'être lié par ces conditions d\'utilisation.',
    },
  },
  // PrivacyPolicyPage
  {
    '36sqvdkt': {
      'en': 'Privacy Policy',
      'fr': 'politique de confidentialité',
    },
    'wu8gl4vl': {
      'en': 'Last updated: August  2025',
      'fr': 'Dernière mise à jour : août 2025',
    },
    'rdxjjk4c': {
      'en':
          'By using TrailDog, you agree to the collection, use, and disclosure of your personal data as described in this Privacy Policy.',
      'fr':
          'En utilisant TrailDog, vous acceptez la collecte, l\'utilisation et la divulgation de vos données personnelles comme décrit dans cette politique de confidentialité.',
    },
    'dx7b50k8': {
      'en': '1. Data We Collect',
      'fr': '1. Données que nous collectons',
    },
    'sqo2duaq': {
      'en':
          '• Non‑personally identifiable data: Device type, operating system, app usage logs, aggregated analytics.\n• Personal data: Account registration information (name, email), GPS location during activities, optional health metrics (heart rate, calories) if you give explicit consent.',
      'fr':
          '• Données non personnelles identifiables : type d’appareil, système d’exploitation, journaux d’utilisation des applications, analyses agrégées.\n• Données personnelles : informations d’enregistrement du compte (nom, e-mail), localisation GPS pendant les activités, mesures de santé facultatives (fréquence cardiaque, calories) si vous donnez votre consentement explicite.',
    },
    'lz6b372k': {
      'en': '2. How We Collect Information',
      'fr': '2. Comment nous collectons les informations',
    },
    'brabipn7': {
      'en':
          '• You provide personal data when creating an account or updating your profile.\n• The app collects location and activity data during use if enabled.\n• Analytics data is collected automatically to improve app performance and user experience.',
      'fr':
          '• Vous fournissez des données personnelles lors de la création d\'un compte ou de la mise à jour de votre profil.\n• L\'application collecte des données de localisation et d\'activité pendant l\'utilisation si cette option est activée.\n• Les données d\'analyse sont collectées automatiquement pour améliorer les performances de l\'application et l\'expérience utilisateur.',
    },
    'oy611k4b': {
      'en': '3. How We Use Your Information',
      'fr': '3. Comment nous utilisons vos informations',
    },
    'laycbaph': {
      'en':
          '• To register and manage your TrailDog account.\n• To track and display your outdoor activities (e.g., hiking, canicross).\n• To personalize your experience (badges, alerts, route recommendations).\n• For analytics and app optimization.\n• To communicate with you about updates, support issues, or changes to the Terms and Policies.',
      'fr':
          '• Pour enregistrer et gérer votre compte TrailDog.\n• Pour suivre et afficher vos activités de plein air (par exemple, randonnée, canicross).\n• Pour personnaliser votre expérience (badges, alertes, recommandations d\'itinéraires).\n• Pour l\'analyse et l\'optimisation de l\'application.\n• Pour vous informer des mises à jour, des problèmes d\'assistance ou des modifications des Conditions générales.',
    },
    'qi5y03e2': {
      'en': '4. Third‑Party Sharing & Disclosure',
      'fr': '4. Partage et divulgation à des tiers',
    },
    '04w4r6dl': {
      'en':
          '• We do not sell or rent your personal data.\n• Data may be shared with trusted third-party service providers (analytics, hosting) under GDPR-compliant agreements.\n• We may disclose personal information if required by law or to protect the safety and rights of users or TrailDog.',
      'fr':
          '• Nous ne vendons ni ne louons vos données personnelles.\n• Les données peuvent être partagées avec des prestataires de services tiers de confiance (analyse, hébergement) dans le cadre d\'accords conformes au RGPD.\n• Nous pouvons divulguer des informations personnelles si la loi l\'exige ou pour protéger la sécurité et les droits des utilisateurs ou de TrailDog.',
    },
    'gw3uu62z': {
      'en': '5. Cookies and Tracking',
      'fr': '5. Abonnements et fonctionnalités premium',
    },
    'gnm4my7o': {
      'en':
          '• We use cookies and similar technologies for functional, analytical, and optional marketing purposes.\n• You can manage or disable cookies in your device settings. Disabling cookies may affect app functionality.',
      'fr':
          '• Nous utilisons des cookies et des technologies similaires à des fins fonctionnelles, analytiques et marketing facultatives.\n• Vous pouvez gérer ou désactiver les cookies dans les paramètres de votre appareil. La désactivation des cookies peut affecter les fonctionnalités de l\'application.',
    },
    'fsqvnyr2': {
      'en': '6. Data Retention & Storage',
      'fr': '6. Conservation et stockage des données',
    },
    '9agld065': {
      'en':
          '• We retain personal data only as long as necessary to fulfill service functions, comply with legal obligations, or resolve disputes.\n• When no longer needed, data is securely deleted or anonymized.',
      'fr':
          '• Nous conservons les données personnelles uniquement le temps nécessaire à l\'exécution des fonctions de service, au respect des obligations légales ou à la résolution des litiges.\n• Lorsqu\'elles ne sont plus nécessaires, les données sont supprimées ou anonymisées en toute sécurité.',
    },
    '9qwfy5c6': {
      'en': '7. Your Rights (GDPR & Similar Laws)',
      'fr': '7. Vos droits (RGPD et lois similaires)',
    },
    'lzhmyv9p': {
      'en':
          'If you are within applicable jurisdictions, you may:\n  • Access your personal data.\n  • Request correction or deletion.\n  • Object to or restrict processing.\n  • Request data portability.\n  • Withdraw consent at any time without affecting prior lawful processing.\n\nTo exercise any rights, contact us via email.',
      'fr':
          'Si vous résidez dans les juridictions compétentes, vous pouvez :\n  • Accéder à vos données personnelles ;\n  • Demander leur rectification ou leur suppression ;\n  • Vous opposer au traitement ou le restreindre ;\n  • Demander la portabilité des données ;\n  • Retirer votre consentement à tout moment sans affecter le traitement légal antérieur.\n\nPour exercer vos droits, contactez-nous par e-mail.',
    },
    'ka9rf86a': {
      'en': '8. Data Security & International Transfers',
      'fr': '8. Sécurité des données et transferts internationaux',
    },
    'f03o9u1i': {
      'en':
          '• We implement industry-standard security measures to protect your data.\n• If data is transferred outside the EU/EEA, we use appropriate safeguards (e.g., EU Standard Contractual Clauses).',
      'fr':
          '• Nous mettons en œuvre des mesures de sécurité conformes aux normes du secteur pour protéger vos données.\n• Si des données sont transférées hors de l\'UE/EEE, nous utilisons des garanties appropriées (par exemple, les clauses contractuelles types de l\'UE).',
    },
    'rwpe5vo9': {
      'en': '9. Minors',
      'fr': '9. Mineurs',
    },
    '7ibyvgdi': {
      'en':
          '• TrailDog is not intended for use by children under 16 without parental consent.\n• We do not knowingly collect data from minors. If discovered, such data will be deleted promptly.',
      'fr':
          '• TrailDog n\'est pas destiné à être utilisé par des enfants de moins de 16 ans sans le consentement de leurs parents.\n• Nous ne collectons pas sciemment de données auprès de mineurs. Si nous les découvrons, ces données seront immédiatement supprimées.',
    },
    '8rt6p3cc': {
      'en': '10. Changes to This Policy',
      'fr': '10. Modifications de cette politique',
    },
    'qb7gpmhg': {
      'en':
          'We may update this Privacy Policy as needed. Material changes will be communicated via in-app notification or email. Continued use after changes constitutes acceptance.',
      'fr':
          'Nous pouvons mettre à jour cette politique de confidentialité si nécessaire. Toute modification importante sera communiquée par notification intégrée à l\'application ou par e-mail. L\'utilisation continue après modification vaut acceptation.',
    },
    'o7uosxom': {
      'en': '11. Contact Us',
      'fr': '11. Contactez-nous',
    },
    'oaa2mbkc': {
      'en': 'For any questions, suggestions, or reports:',
      'fr': 'Pour toute question, suggestion ou signalement :',
    },
    'q3in4xh6': {
      'en': 'devmobflutterflow@gmail.com',
      'fr': 'devmobflutterflow@gmail.com',
    },
    'y8wg55bv': {
      'en':
          'By continuing to use this application, you acknowledge that you have read, understood, and agree to be bound by this Privacy Policy.',
      'fr':
          'En continuant à utiliser cette application, vous reconnaissez avoir lu, compris et accepté d\'être lié par cette politique de confidentialité.',
    },
  },
  // EditActivityPage
  {
    '8k8sn58d': {
      'en': 'edit activity',
      'fr': 'modifier l\'activité',
    },
    '2og6o44r': {
      'en': 'Activity Name',
      'fr': 'Nom de l\'activité',
    },
    '4vd7bxfy': {
      'en': 'Enter activity name',
      'fr': 'Entrez le nom de l\'activité',
    },
    'et2ux204': {
      'en': 'Activity Type',
      'fr': 'Type d\'activité',
    },
    'j13buwmq': {
      'en': 'Select activity type',
      'fr': '',
    },
    '8idx01p9': {
      'en': 'Cani-cross',
      'fr': 'Cani-cross',
    },
    'o97knoad': {
      'en': 'Cani-VTT',
      'fr': 'Cani-VTT',
    },
    '94f8chp0': {
      'en': 'Cani-hicking',
      'fr': 'Cani-randonnée',
    },
    'fe105i8e': {
      'en': 'Activity Details',
      'fr': 'Détails de l\'activité',
    },
    'uink5sj3': {
      'en': 'Created',
      'fr': 'Créé',
    },
    'cx4quup4': {
      'en': 'Duration',
      'fr': 'Durée',
    },
    '0v7shc7v': {
      'en': 'Save Changes',
      'fr': 'Enregistrer les modifications',
    },
  },
  // DeviceConnectPage
  {
    'vcx91hwf': {
      'en': 'Connect a Device',
      'fr': 'Connecter un appareil',
    },
    'uwkmzu6z': {
      'en': 'Devices for the User',
      'fr': 'Dispositifs pour l\'utilisateur',
    },
    'p62669jq': {
      'en': 'Smartwatch',
      'fr': 'Montre connectée',
    },
    'gqtmxq5y': {
      'en': 'Heart Rate Belt',
      'fr': 'Ceinture de fréquence cardiaque',
    },
    'njb3lp6y': {
      'en': 'Coming soon',
      'fr': '',
    },
    'cgdfqrp1': {
      'en': 'Devices for the Dog',
      'fr': 'Appareils pour le chien',
    },
    '7m2koobn': {
      'en': 'Tractive GPS',
      'fr': 'GPS Tractive',
    },
    'x9eunvnx': {
      'en': 'Wennect GPS',
      'fr': 'Wennect GPS',
    },
    '1nlbtczf': {
      'en': 'Device Connection Tips',
      'fr': 'Conseils de connexion des appareils',
    },
    '35imseev': {
      'en':
          'Make sure your devices are powered on and within range. Some devices may require additional setup in their respective apps.',
      'fr':
          'Assurez-vous que vos appareils sont allumés et à portée. Certains appareils peuvent nécessiter une configuration supplémentaire dans leurs applications respectives.',
    },
  },
  // SupportPage
  {
    'jpmimj2t': {
      'en': 'Help & Support',
      'fr': 'Aide et support',
    },
    'pznul6jb': {
      'en': 'Need help? Check our FAQ or contact us directly.',
      'fr':
          'Besoin d\'aide ? Consultez notre FAQ ou contactez-nous directement.',
    },
    '8pdcllhp': {
      'en': 'How do I use TrailDog?',
      'fr': 'Comment utiliser TrailDog ?',
    },
    'hwp5jxx7': {
      'en':
          'TrailDog helps you record your activities, track your dog\'s progress, and share adventures with the community.',
      'fr':
          'TrailDog vous aide à enregistrer vos activités, à suivre les progrès de votre chien et à partager vos aventures avec la communauté.',
    },
    '4z07q29v': {
      'en': 'How do I report a bug?',
      'fr': 'Comment signaler un bug ?',
    },
    '6s3n0rhw': {
      'en':
          'Click the \'Contact Support\' button below or email us at devmobflutterflow@gmail.com.',
      'fr':
          'Cliquez sur le bouton « Contacter l\'assistance » ci-dessous ou envoyez-nous un e-mail à devmobflutterflow@gmail.com.',
    },
    'a8vrwnjq': {
      'en': 'How do I sync my data across devices?',
      'fr': 'Comment synchroniser mes données sur plusieurs appareils ?',
    },
    'it6a3ol9': {
      'en':
          'Your data automatically syncs when you\'re logged in to your TrailDog account. Make sure you\'re connected to the internet for the best experience.',
      'fr':
          'Vos données se synchronisent automatiquement lorsque vous êtes connecté à votre compte TrailDog. Assurez-vous d\'être connecté à Internet pour une expérience optimale.',
    },
    'y6erwg9a': {
      'en': 'Can I track multiple dogs?',
      'fr': 'Puis-je suivre plusieurs chiens ?',
    },
    'en563zu8': {
      'en':
          'Yes! You can add multiple dog profiles and track each of their activities separately. Go to Settings > Manage Dogs to add more furry friends.',
      'fr':
          'Oui ! Vous pouvez ajouter plusieurs profils de chiens et suivre leurs activités séparément. Accédez à Paramètres > Gérer les chiens pour ajouter d\'autres compagnons à quatre pattes.',
    },
    '1xzhaa18': {
      'en': 'Still need help? Send us a message:',
      'fr': 'Besoin d\'aide ? Envoyez-nous un message :',
    },
    'srgsbrwu': {
      'en': 'Contact Support',
      'fr': 'Contacter le support',
    },
  },
  // MessageSettingsPage
  {
    'zwafdm7v': {
      'en': 'Messages Settings',
      'fr': 'Paramètres des messages',
    },
    '83kpa6qc': {
      'en': 'Allow messages from',
      'fr': 'Autoriser les messages de',
    },
    '30hahyvy': {
      'en': 'Everyone',
      'fr': 'Tout le monde',
    },
    'l2hvr05a': {
      'en': 'Read receipts',
      'fr': 'Lire les reçus',
    },
    'dxfs5voy': {
      'en': 'New message notifications',
      'fr': 'Notifications de nouveaux messages',
    },
    '98cic5e3': {
      'en': 'Blocked users',
      'fr': 'Utilisateurs bloqués',
    },
    'xkgc1e3o': {
      'en': 'Blocked users',
      'fr': 'Utilisateurs bloqués',
    },
    'ztov6dn0': {
      'en': 'Home',
      'fr': '',
    },
  },
  // PrivacySecurityPage
  {
    'mp4hn5rq': {
      'en': 'Privacy & Security',
      'fr': 'Confidentialité et sécurité',
    },
    '1p2b1j49': {
      'en': 'Manage your privacy and security settings.',
      'fr': 'Gérez vos paramètres de confidentialité et de sécurité.',
    },
    '0e5nhb3o': {
      'en': 'Terms of Service',
      'fr': 'Conditions d\'utilisation',
    },
    'qwiqqp8f': {
      'en': 'Read our Terms of Service',
      'fr': 'Lisez nos conditions d\'utilisation',
    },
    '6cm36l64': {
      'en': 'Privacy Policy',
      'fr': 'politique de confidentialité',
    },
    'd7k3uh7s': {
      'en': 'Read our Privacy Policy',
      'fr': 'Lisez notre politique de confidentialité',
    },
    'zc4jcskg': {
      'en': 'Change password',
      'fr': 'Changer le mot de passe',
    },
    'uvikb1uk': {
      'en': 'Download my data',
      'fr': 'Télécharger mes données',
    },
    'thd2g6sv': {
      'en': 'Delete my account',
      'fr': 'Supprimer mon compte',
    },
    'ly59vwoe': {
      'en': 'Home',
      'fr': '',
    },
  },
  // HealthRecordsPage
  {
    '15p1ksxv': {
      'en': 'Health Records',
      'fr': 'dossiers de santé',
    },
    '6gnf6ogw': {
      'en': 'Vaccinations',
      'fr': 'Vaccinations',
    },
    '3umkhtee': {
      'en': 'Rabies Vaccine',
      'fr': 'Vaccin contre la rage',
    },
    '2u83p2cw': {
      'en': 'Due: March 15, 2024',
      'fr': 'Date limite : 15 mars 2024',
    },
    'j4qcjcue': {
      'en': 'DHPP Vaccine',
      'fr': 'Vaccin DHPP',
    },
    'uubi1e7m': {
      'en': 'Overdue: Feb 20, 2024',
      'fr': 'En retard : 20 février 2024',
    },
    '5whucwwz': {
      'en': 'Bordetella Vaccine',
      'fr': 'Vaccin contre la Bordetella',
    },
    '5mp7ijty': {
      'en': 'Completed: Jan 10, 2024',
      'fr': 'Terminé : 10 janvier 2024',
    },
    '8ktdrmmm': {
      'en': 'Veterinary Reports',
      'fr': 'Rapports vétérinaires',
    },
    'kgo46z5g': {
      'en': 'Annual Checkup Report',
      'fr': 'Rapport de contrôle annuel',
    },
    'v3ii8tt5': {
      'en': 'Dr. Smith • Feb 28, 2024',
      'fr': 'Dr Smith • 28 février 2024',
    },
    'ihsjezj5': {
      'en': 'X-Ray Results',
      'fr': 'Résultats des radiographies',
    },
    'd9yebnxs': {
      'en': 'Emergency Vet • Jan 15, 2024',
      'fr': 'Urgence vétérinaire • 15 janvier 2024',
    },
    'vzayvtpp': {
      'en': 'Blood Test Results',
      'fr': 'Résultats des analyses de sang',
    },
    'k7ulwn54': {
      'en': 'VetCare Clinic • Dec 20, 2023',
      'fr': 'Clinique vétérinaire • 20 déc. 2023',
    },
    'eidc3bk7': {
      'en': 'Medical History',
      'fr': 'Antécédents médicaux',
    },
    'snbeu0l1': {
      'en': 'Allergies',
      'fr': 'Allergies',
    },
    'vqx24cql': {
      'en': 'Updated: Feb 1, 2024',
      'fr': 'Mis à jour : 1er février 2024',
    },
    'n6q3aho6': {
      'en': 'Chicken, certain antibiotics (Penicillin)',
      'fr': 'Poulet, certains antibiotiques (pénicilline)',
    },
    'x92635zm': {
      'en': 'Chronic Conditions',
      'fr': 'maladies chroniques',
    },
    't0v7yncr': {
      'en': 'Updated: Jan 10, 2024',
      'fr': 'Mis à jour : 10 janvier 2024',
    },
    '3wd71oi0': {
      'en':
          'Mild hip dysplasia, managed with supplements and exercise modification',
      'fr':
          'Dysplasie légère de la hanche, gérée avec des suppléments et une modification de l\'exercice',
    },
    'k73c972o': {
      'en': 'Previous Surgeries',
      'fr': 'Chirurgies antérieures',
    },
    'qy3bnmwt': {
      'en': 'Updated: Dec 15, 2023',
      'fr': 'Mis à jour : 15 décembre 2023',
    },
    'fetljmea': {
      'en': 'Spay surgery (2022), Dental cleaning with extractions (2023)',
      'fr':
          'Chirurgie de stérilisation (2022), Nettoyage dentaire avec extractions (2023)',
    },
    'dv0m7wun': {
      'en': 'Current Medications',
      'fr': 'Médicaments actuels',
    },
    'yp5oclim': {
      'en': 'Updated: Feb 28, 2024',
      'fr': 'Mis à jour : 28 février 2024',
    },
    '4auqa86r': {
      'en': 'Glucosamine supplement (daily), Omega-3 fish oil (daily)',
      'fr':
          'Supplément de glucosamine (quotidien), huile de poisson oméga-3 (quotidien)',
    },
    'tv9tppfn': {
      'en': 'Add New Record',
      'fr': 'Ajouter un nouvel enregistrement',
    },
  },
  // AdvancedAnalyticsPage
  {
    'jg3it4di': {
      'en': 'Advanced Analytics',
      'fr': 'Analyse avancée',
    },
    'eg3cbgan': {
      'en': 'Performance Graphs',
      'fr': 'Graphiques de performances',
    },
    's56j9tnp': {
      'en': 'Month',
      'fr': 'Mois',
    },
    '7peu0nxd': {
      'en': 'Period',
      'fr': '',
    },
    'tocqll8b': {
      'en': 'Week',
      'fr': 'Semaine',
    },
    'am9but25': {
      'en': 'Month',
      'fr': 'Mois',
    },
    'w6agh5p0': {
      'en': 'Year',
      'fr': 'Année',
    },
    'qf2l1znz': {
      'en': 'Activity',
      'fr': '',
    },
    'jkf0blgz': {
      'en': 'Cani-cross',
      'fr': 'Cani-cross',
    },
    'blv7um0n': {
      'en': 'Cani-VTT',
      'fr': 'Cani-VTT',
    },
    'yf4sakgk': {
      'en': 'Canii-hicking',
      'fr': 'Cani-randonnée',
    },
    'cemhtgkd': {
      'en': 'All',
      'fr': 'Tous',
    },
    'wgtlztl3': {
      'en': 'Speed Performance Chart',
      'fr': 'Tableau des performances de vitesse',
    },
    'k5r3y0u5': {
      'en': 'Interactive chart showing speed trends over time',
      'fr':
          'Graphique interactif montrant les tendances de vitesse au fil du temps',
    },
    'epzeoueb': {
      'en': 'Distance Analytics',
      'fr': 'Analyse de distance',
    },
    'wf30c8qg': {
      'en': 'Track your distance progress and milestones',
      'fr': 'Suivez votre progression en distance et vos étapes importantes',
    },
    'pwktijnk': {
      'en': 'Heart Rate Zones',
      'fr': 'Zones de fréquence cardiaque',
    },
    'vexceq1e': {
      'en': 'Monitor your heart rate patterns and zones',
      'fr': 'Surveillez vos schémas et zones de fréquence cardiaque',
    },
    '2w6mxwjb': {
      'en': 'Insights',
      'fr': 'Connaissances',
    },
    'w0rf5kn1': {
      'en': '24.5',
      'fr': '24,5',
    },
    'h9car9k0': {
      'en': 'Avg Speed (km/h)',
      'fr': 'Vitesse moyenne (km/h)',
    },
    'g60s0dv5': {
      'en': '142',
      'fr': '142',
    },
    'pqactm2t': {
      'en': 'Total Distance (km)',
      'fr': 'Distance totale (km)',
    },
    'am7xqqiq': {
      'en': '2,847',
      'fr': '2 847',
    },
    'hbfgdb94': {
      'en': 'Calories Burned',
      'fr': 'Calories brûlées',
    },
    'nqmdj9no': {
      'en': '18h 32m',
      'fr': '18h 32m',
    },
    'nqc43f34': {
      'en': 'Total Time',
      'fr': 'Durée totale',
    },
    '0g9kvlpj': {
      'en': 'Recent Trends',
      'fr': 'Tendances récentes',
    },
    'fp7x9qbm': {
      'en': 'Speed improvement',
      'fr': 'Amélioration de la vitesse',
    },
    'ud3gw5yc': {
      'en': '+12% this month',
      'fr': '+12% ce mois-ci',
    },
    'koq3grx1': {
      'en': 'Distance consistency',
      'fr': 'Cohérence des distances',
    },
    'y4cogbqe': {
      'en': '+8% this week',
      'fr': '+8% cette semaine',
    },
    'u9rwfr8g': {
      'en': 'Heart rate efficiency',
      'fr': 'Efficacité de la fréquence cardiaque',
    },
    'up5256hl': {
      'en': '+5% improvement',
      'fr': '+5% d\'amélioration',
    },
    'lftrjii0': {
      'en': 'Achievements',
      'fr': 'Réalisations',
    },
    'hziwvhj5': {
      'en': 'Speed Demon',
      'fr': 'Démon de la vitesse',
    },
    're38to3r': {
      'en': 'Reached 30+ km/h average',
      'fr': 'A atteint une moyenne de plus de 30 km/h',
    },
    'qio82dfx': {
      'en': 'Distance Master',
      'fr': 'Maître de distance',
    },
    '20kye33n': {
      'en': 'Completed 100km milestone',
      'fr': 'Le cap des 100 km a été franchi',
    },
    '66qldhsw': {
      'en': 'Consistency King',
      'fr': 'Roi de la cohérence',
    },
    'adlek8o8': {
      'en': '7 days streak achieved',
      'fr': 'Série de 7 jours réalisée',
    },
  },
  // SubscriptionPage
  {
    'v9n3mbeb': {
      'en': 'Manage Subscription',
      'fr': 'Gérer l\'abonnement',
    },
    'uuqn75wo': {
      'en': 'Current Plan',
      'fr': 'Plan actuel',
    },
    'nxghuq2f': {
      'en': 'Premium',
      'fr': 'Premium',
    },
    'i7zy4diz': {
      'en': '\$6.99/month',
      'fr': '6,99 €/mois',
    },
    'tc2vjbhn': {
      'en':
          'Access to all premium features including unlimited storage, advanced analytics, and priority support.',
      'fr':
          'Accès à toutes les fonctionnalités premium, y compris le stockage illimité, les analyses avancées et l\'assistance prioritaire.',
    },
    'uwb2bx0z': {
      'en': 'Subscription Details',
      'fr': 'Détails de l\'abonnement',
    },
    '6vgl1od0': {
      'en': 'Start Date',
      'fr': 'Date de début',
    },
    'avh57t6r': {
      'en': 'January 15, 2024',
      'fr': '15 janvier 2024',
    },
    'h6k2bg43': {
      'en': 'Renewal Date',
      'fr': 'Date de renouvellement',
    },
    'e82bpo1p': {
      'en': 'February 15, 2024',
      'fr': '15 février 2024',
    },
    'ao3ra4i1': {
      'en': 'Next Payment',
      'fr': 'Prochain paiement',
    },
    '9zdld96z': {
      'en': '\$6.99',
      'fr': '6,99 €',
    },
    'd3ppynl3': {
      'en': 'Payment Method',
      'fr': 'Mode de paiement',
    },
    '512f4duy': {
      'en': '•••• 4242',
      'fr': '',
    },
    '1a10nqxj': {
      'en': 'Update Payment',
      'fr': 'Mettre à jour le paiement',
    },
    'yg2g0xz6': {
      'en': 'Cancel Subscription',
      'fr': 'Annuler l\'abonnement',
    },
    '9evik5il': {
      'en': 'Invoices & Payment History',
      'fr': 'Factures et historique des paiements',
    },
    'thc70h8z': {
      'en': 'Premium Subscription',
      'fr': 'Abonnement Premium',
    },
    'e3jvg8t0': {
      'en': 'January 15, 2024',
      'fr': '15 janvier 2024',
    },
    'df9vj333': {
      'en': '\$6.99',
      'fr': '6,99 €',
    },
    'k9y994x6': {
      'en': 'Paid',
      'fr': 'Payé',
    },
    '0os44kc6': {
      'en': 'Premium Subscription',
      'fr': 'Abonnement Premium',
    },
    'x0oyx5mj': {
      'en': 'December 15, 2023',
      'fr': '15 décembre 2023',
    },
    'v6cmrzxy': {
      'en': '\$6.99',
      'fr': '6,99 €',
    },
    'vbus4fww': {
      'en': 'Paid',
      'fr': 'Payé',
    },
    'ae9qlw4s': {
      'en': 'Premium Subscription',
      'fr': 'Abonnement Premium',
    },
    'yxf46m7p': {
      'en': 'November 15, 2023',
      'fr': '15 novembre 2023',
    },
    'cbwjkqtj': {
      'en': '\$6.99',
      'fr': '6,99 €',
    },
    'r9n7xrnh': {
      'en': 'Paid',
      'fr': 'Payé',
    },
    'dnwbyz5c': {
      'en': 'View All Invoices',
      'fr': 'Afficher toutes les factures',
    },
  },
  // NavbarComponent
  {
    '83hf62vl': {
      'en': 'Home',
      'fr': 'Maison',
    },
    '1xlvbmd9': {
      'en': 'Activities',
      'fr': 'Activités',
    },
    '5i903sso': {
      'en': 'messages',
      'fr': 'messages',
    },
    'jvu533y8': {
      'en': 'Profile',
      'fr': 'Profil',
    },
  },
  // StatsDogPerformanceComponent
  {
    'ddlmjk50': {
      'en': 'Border colie',
      'fr': 'Border collie',
    },
    'dw2riaz9': {
      'en': 'Master of the mountains',
      'fr': 'Maître des montagnes',
    },
    'hzu6vfut': {
      'en': 'Sprint specialty',
      'fr': 'Spécialité Sprint',
    },
    'iadjy24o': {
      'en': 'Weekly',
      'fr': 'Hebdomadaire',
    },
    'kt2vzf03': {
      'en': 'Monthly',
      'fr': 'Mensuel',
    },
  },
  // StatsPersonPerformanceComponent
  {
    'zx8g2p1o': {
      'en': 'Weekly',
      'fr': 'Hebdomadaire',
    },
    'okcjwgtb': {
      'en': 'Monthly',
      'fr': 'Mensuel',
    },
  },
  // ActivityComponent
  {
    'xxvwf8sp': {
      'en': 'M',
      'fr': 'M',
    },
    '9o3gm99h': {
      'en': 'Time',
      'fr': 'Temps',
    },
    '8r7x9591': {
      'en': 'Distance',
      'fr': 'Distance',
    },
    '5of30ef8': {
      'en': 'Pace',
      'fr': 'Rythme',
    },
  },
  // SantePerformanceComponent
  {
    '93eksapo': {
      'en': 'HR Average',
      'fr': 'FC moyenne',
    },
    's2uym7fm': {
      'en': 'Healthy zone',
      'fr': 'Zone saine',
    },
    'bde13ds5': {
      'en': '143 BPM',
      'fr': '143 BPM',
    },
    'yd0ntl5e': {
      'en': 'Recovery Rate',
      'fr': 'Taux de récupération',
    },
    '3lc5v2zt': {
      'en': 'Good condition',
      'fr': 'Bon état',
    },
    'nqidtq62': {
      'en': '85%',
      'fr': '85%',
    },
  },
  // ProfilDogComponent
  {
    'fawbgk7y': {
      'en': 'Activities',
      'fr': 'Activités',
    },
    'b067qgbt': {
      'en': 'Distance',
      'fr': 'Distance',
    },
    '142n7znt': {
      'en': 'Badges',
      'fr': 'Insignes',
    },
  },
  // SuccessPerfomanceComponent
  {
    '86fztvgv': {
      'en': 'Successes',
      'fr': 'Succès',
    },
    '0kyuzq6v': {
      'en': 'See All',
      'fr': 'Tout voir',
    },
    'tzftkkdp': {
      'en': 'Club 100km',
      'fr': 'Club 100km',
    },
    'ghoxclaa': {
      'en': 'Completed 100km of tracked activities',
      'fr': '100 km d\'activités suivies ont été réalisés',
    },
    '14kp23gw': {
      'en': '75%',
      'fr': '75%',
    },
    'qbnucr9t': {
      'en': 'Early riser',
      'fr': 'Lève-tôt',
    },
    '6oag0swl': {
      'en': 'Completed 10 morning sessions',
      'fr': 'J\'ai terminé 10 séances du matin',
    },
    'vvjn5rev': {
      'en': '90%',
      'fr': '90%',
    },
    'k5wlqbdr': {
      'en': 'Pack Leader',
      'fr': 'Chef de meute',
    },
    'drx9730p': {
      'en': 'Invite 5 friends to join the app',
      'fr': 'Invitez 5 amis à rejoindre l\'application',
    },
    '4v9nkf0v': {
      'en': '40%',
      'fr': '40%',
    },
  },
  // DogActivityPerformanceComponent
  {
    'cpxpfviy': {
      'en': 'Recent Activities',
      'fr': 'Activités récentes',
    },
    '5wgeyxp9': {
      'en': 'M',
      'fr': 'M',
    },
    'o2ju2wr8': {
      'en': 'Morning Race',
      'fr': 'Course du matin',
    },
    'nvuv6wsh': {
      'en': '3.2km • 25min',
      'fr': '3,2 km • 25 min',
    },
    'fbcm80r6': {
      'en': 'Canicross',
      'fr': 'Canicross',
    },
    '3wfde8c9': {
      'en': 'M',
      'fr': 'M',
    },
    'utnvx4io': {
      'en': 'Adventure Trail',
      'fr': 'Parcours aventure',
    },
    'wtcnfew2': {
      'en': '5.8km • 48min',
      'fr': '5,8 km • 48 min',
    },
    'r8exvb8t': {
      'en': 'Cani Hiking',
      'fr': 'Cani-Randonnée',
    },
    'hvcj01cb': {
      'en': 'M',
      'fr': 'M',
    },
    'r5x1tm0h': {
      'en': 'Evening Walk',
      'fr': 'Promenade du soir',
    },
    '23wwsl8j': {
      'en': '2.1km • 30min',
      'fr': '2,1 km • 30 min',
    },
    'os687150': {
      'en': 'Ride',
      'fr': 'Monter',
    },
  },
  // PartnerComponent
  {
    'h271jpnl': {
      'en': 'Sarah',
      'fr': 'Sarah',
    },
    'tty4k3kf': {
      'en': '2 hours ago',
      'fr': 'il y a 2 heures',
    },
  },
  // ShareNetworkComponent
  {
    'omkcihzw': {
      'en': 'Partager votre performance',
      'fr': 'Partagez vos performances',
    },
    'oh849ntk': {
      'en': 'J\'ai terminé une activité : 5.2 km en 28:45 à 5:32 min/km !',
      'fr': 'J\'ai terminé une activité : 5,2 km en 28:45 à 5:32 min/km !',
    },
    'c7zc0fhn': {
      'en': 'Instagram',
      'fr': 'Instagram',
    },
    'i69pjg6r': {
      'en': 'Facebook',
      'fr': 'Facebook',
    },
  },
  // DeleteDogComponent
  {
    '489pot2w': {
      'en': 'Delete this dog',
      'fr': 'Supprimer ce chien',
    },
    'gz7fylas': {
      'en':
          'This action is irreversible. Are you sure you want to permanently delete this dog?',
      'fr':
          'Cette action est irréversible. Êtes-vous sûr de vouloir supprimer définitivement ce chien ?',
    },
    'n32bccby': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    'vjez6ik5': {
      'en': 'Delete',
      'fr': 'Supprimer',
    },
  },
  // DeleteActivityComponent
  {
    '55cpyc18': {
      'en': 'Delete this activity',
      'fr': 'Supprimer cette activité',
    },
    'xe6q6g2b': {
      'en':
          'This action is irreversible. Are you sure you want to permanently delete this activity ?',
      'fr':
          'Cette action est irréversible. Voulez-vous vraiment supprimer définitivement cette activité ?',
    },
    'y489yzyx': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    'frw257hk': {
      'en': 'Delete',
      'fr': 'Supprimer',
    },
  },
  // AskFriendsComponent
  {
    'nmanwo3z': {
      'en': 'Request sended',
      'fr': 'Demande envoyée',
    },
    '7jalmnxd': {
      'en': 'Follow',
      'fr': 'Suivre',
    },
  },
  // DemandeFriendsCompoennt
  {
    'uqfyzhod': {
      'en': 'Thomas Leroy',
      'fr': 'Thomas Leroy',
    },
    'hpm688ib': {
      'en': 'Accepter',
      'fr': 'Accepteur',
    },
    'scixtgtm': {
      'en': 'Refuser',
      'fr': 'Refusant',
    },
  },
  // FriendRequestComponent
  {
    'kg6e06eh': {
      'en': 'Annuler',
      'fr': 'Annuler',
    },
  },
  // FriendRequestNotificationComponent
  {
    'ew7sr2g4': {
      'en': 'New friend',
      'fr': 'Nouvel ami',
    },
    '7ztoxo3p': {
      'en': 'Friend request by : ',
      'fr': 'Demande d\'ami par :',
    },
    'yx6obllz': {
      'en': 'Accept',
      'fr': 'Accepter',
    },
    'r3t3ez79': {
      'en': 'Refuse',
      'fr': 'Refuser',
    },
  },
  // NewCommentNotificationsComponent
  {
    'i88gkgl0': {
      'en': 'Nouveau commentaire',
      'fr': 'Nouveau commentaire',
    },
    '4he8xhhf': {
      'en': 'Il y a 32 min',
      'fr': 'Il y a 32 minutes',
    },
    '5zd5jmex': {
      'en':
          'Julie a commenté : \\\"Magnifique parcours ! Mon Golden Retriever adorerait cet endroit\\\"',
      'fr':
          'Julie a commenté : \\\"Magnifique parcours ! Mon Golden Retriever adorait cet endroit\\\"',
    },
  },
  // NewMessageNotificationComponent
  {
    '7cvs4lxc': {
      'en': 'Nouveau message',
      'fr': 'Nouveau message',
    },
    'ktq5zz8i': {
      'en': 'New message by : ',
      'fr': 'Nouveau message de :',
    },
  },
  // NewEventNotificationComponent
  {
    'oxkno7xi': {
      'en': 'Nouvel événement',
      'fr': 'Nouvel événement',
    },
    'ffpvnpgf': {
      'en': 'Il y a 2h',
      'fr': 'Il y a 2h',
    },
    'n78smkx0': {
      'en': 'Randonnée collective au Mont Blanc - Samedi 15 décembre à 9h00',
      'fr': 'Randonnée collective au Mont Blanc - Samedi 15 décembre à 9h00',
    },
    'yidowcbp': {
      'en': 'Voir l\'événement',
      'fr': 'Voir l\'événement',
    },
  },
  // EventComponent
  {
    'aqm0f7yj': {
      'en': 'Weekend Canicross Meetup',
      'fr': 'Rencontre de canicross du week-end',
    },
    'n2n8fzes': {
      'en': 'canicross',
      'fr': 'canicross',
    },
    'zfdti0nx': {
      'en': 'May 25, 2025',
      'fr': '25 mai 2025',
    },
    'zp8w82ew': {
      'en': 'Central Park',
      'fr': 'Parc central',
    },
    'hkakh2al': {
      'en': '14 attending',
      'fr': '14 participants',
    },
    'ptb3nixt': {
      'en': 'Join',
      'fr': 'Rejoindre',
    },
  },
  // SelectActivityComponent
  {
    'pivkftf0': {
      'en': 'Select Activity',
      'fr': 'Sélectionner une activité',
    },
    'jh43i2ux': {
      'en': 'Cani-cross',
      'fr': 'Cani-cross',
    },
    'c9fg6ezc': {
      'en': 'Cani-VTT',
      'fr': 'Cani-VTT',
    },
    'ulj1jzpg': {
      'en': 'cani-hicking',
      'fr': 'cani-randonnée',
    },
  },
  // DeletePostComponent
  {
    'ijaw91im': {
      'en': 'Delete this post',
      'fr': 'Supprimer ce message',
    },
    '25rr0heq': {
      'en':
          'This action is irreversible. Are you sure you want to permanently delete this post?',
      'fr':
          'Cette action est irréversible. Voulez-vous vraiment supprimer définitivement ce message ?',
    },
    'gy5rso1m': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    '9gcgtm1k': {
      'en': 'Delete',
      'fr': 'Supprimer',
    },
  },
  // BadgesComponent
  {
    'j80pypv5': {
      'en': 'Lève-tôt',
      'fr': 'Lève-tôt',
    },
    '8elgyr4u': {
      'en': 'Terminer 5 activités avant 8h du matin',
      'fr': 'Terminer 5 activités avant 8h du matin',
    },
  },
  // NoRewardsComponent
  {
    'q8dxu368': {
      'en': 'Badges not yet available',
      'fr': 'Les badges ne sont pas encore disponibles',
    },
  },
  // NoStatsComponent
  {
    'yv6r1sur': {
      'en': 'Stats  not yet available',
      'fr': 'Statistiques pas encore disponibles',
    },
  },
  // NotificationsSettings
  {
    'nrdqtbzo': {
      'en': 'Paramètres de Notification',
      'fr': 'Paramètres de notification',
    },
    '9lyo0hpf': {
      'en': 'Catégories de Notifications',
      'fr': 'Catégories de notifications',
    },
    'r17lz83d': {
      'en': 'Messages',
      'fr': 'Messages',
    },
    'i8gncjjr': {
      'en': 'Notifications pour nouveaux messages et discussions de groupe',
      'fr': 'Notifications pour nouveaux messages et discussions de groupe',
    },
    'glwcxp8p': {
      'en': 'Rappels Santé',
      'fr': 'Rappels Santé',
    },
    '8y3qpvai': {
      'en': 'Rappels de vaccination et alertes santé',
      'fr': 'Rappels de vaccination et alertes santé',
    },
    'wlf1l9jh': {
      'en': 'Accomplissements',
      'fr': 'Réalisations',
    },
    '70kl84dv': {
      'en': 'Badges, jalons et accomplissements',
      'fr': 'Insignes, jalons et réalisations',
    },
    'a7a66x10': {
      'en': 'Interactions Sociales',
      'fr': 'Interactions sociales',
    },
    '3n2qynj5': {
      'en': 'J\'aime, commentaires et mentions',
      'fr': 'J\'aime, commentaires et mentions',
    },
    '9vkc8zt0': {
      'en': 'Événements',
      'fr': 'Événements',
    },
    'rtftp4gc': {
      'en': 'Événements et activités à venir',
      'fr': 'Événements et activités à venir',
    },
    '1d2wm3bb': {
      'en': 'Paramètres Généraux',
      'fr': 'Paramètres Généraux',
    },
    'eftwstgy': {
      'en': 'Notifications Push',
      'fr': 'Notifications Push',
    },
    'g9jep287': {
      'en': 'Recevoir des notifications sur votre appareil',
      'fr': 'Recevoir des notifications sur votre appareil',
    },
    'xsgs9001': {
      'en': 'Notifications Email',
      'fr': 'Notifications par e-mail',
    },
    'i8l9sny7': {
      'en': 'Recevoir des résumés et alertes par email',
      'fr': 'Recevoir des CV et alertes par email',
    },
    'i30krmkh': {
      'en': 'Ne Pas Déranger',
      'fr': 'Ne Pas Déranger',
    },
    'qv57ivah': {
      'en': 'Couper temporairement toutes les notifications',
      'fr': 'Couper temporairement toutes les notifications',
    },
    'cmxayvzs': {
      'en': 'Sauvegarder les Préférences',
      'fr': 'Sauvegarder les Préférences',
    },
  },
  // CommentsComponent
  {
    '3b8x91yw': {
      'en': 'Comments',
      'fr': 'Commentaires',
    },
    'uii732q5': {
      'en': 'No comments yet',
      'fr': 'Aucun commentaire pour le moment',
    },
    'oaygg5x8': {
      'en': 'Add a comment...',
      'fr': 'Ajouter un commentaire...',
    },
  },
  // FeedActivityCompoennt
  {
    'f178vfur': {
      'en': 'Distance',
      'fr': 'Distance',
    },
    'gnsfs51g': {
      'en': 'Step',
      'fr': 'Pas',
    },
    'ydz9m7yl': {
      'en': 'Duration',
      'fr': 'Durée',
    },
  },
  // NotFoundFriendComponent
  {
    '913qp5te': {
      'en': 'not friends found',
      'fr': 'pas d\'amis trouvés',
    },
    'r3a3ux48': {
      'en': 'You haven\'t found any friends',
      'fr': 'Tu n\'as pas trouvé d\'amis',
    },
  },
  // SubscriptionComponent
  {
    'ev3r2dd9': {
      'en': ' Unlock Premium Features!',
      'fr': 'Débloquez des fonctionnalités Premium !',
    },
    '2di5iwia': {
      'en':
          'Get access to advanced analytics, health tracking, device integrations, and exclusive content for your furry friend.',
      'fr':
          'Accédez à des analyses avancées, au suivi de la santé, aux intégrations d\'appareils et au contenu exclusif pour votre ami à quatre pattes.',
    },
    '7tjtvgib': {
      'en': 'Go Premium',
      'fr': 'Passez  Premium',
    },
  },
  // confidentialite
  {
    'i1zz4874': {
      'en': 'Confidentialité',
      'fr': '',
    },
    'myoy98d2': {
      'en': 'Profil Privé',
      'fr': '',
    },
    'upef77h6': {
      'en': 'Seuls vos amis peuvent voir vos activités',
      'fr': '',
    },
    'ft12i8kj': {
      'en': 'Activités Visibles',
      'fr': '',
    },
    'rckyrx84': {
      'en': 'Permettre à d\'autres utilisateurs de voir vos courses',
      'fr': '',
    },
    '58305x48': {
      'en': 'Localisation',
      'fr': '',
    },
    'jgmcgwtb': {
      'en': 'Partager votre position avec vos amis pendant les courses',
      'fr': '',
    },
  },
  // MonthlyPaywallComponent
  {
    'a8g63tqe': {
      'en': 'TrailDog',
      'fr': '',
    },
    '7kmt5urg': {
      'en': 'Unlock Premium Today',
      'fr': '',
    },
    'p6yeiwc2': {
      'en': 'Get access to all subscriber benefits',
      'fr': '',
    },
    'gcrb9dpj': {
      'en': 'Advanced analytics',
      'fr': '',
    },
    '9vqneea7': {
      'en':
          'Track your performance with interactive charts for speed, elevation, and cadence.',
      'fr': '',
    },
    'rm4c87jl': {
      'en': 'Segments & leaderboards',
      'fr': '',
    },
    '86nymjco': {
      'en': 'Compare your stats with others on selected trail segments.',
      'fr': '',
    },
    '7g03v8uc': {
      'en': 'Health alerts',
      'fr': '',
    },
    'b3o409ok': {
      'en':
          'Get reminders for vet visits and notifications when heart rate thresholds are exceeded.',
      'fr': '',
    },
    '9ruqdz4f': {
      'en': 'AI recommendations',
      'fr': '',
    },
    '6z5lfyxv': {
      'en':
          'Discover new trails with personalized route suggestions powered by AI.',
      'fr': '',
    },
    '0fdfs4ac': {
      'en': 'Premium account management',
      'fr': '',
    },
    'd1o6a6f7': {
      'en':
          'Easily manage your subscription and unlock all premium benefits from one place.',
      'fr': '',
    },
    'r8xkj8nf': {
      'en': 'Your subscription auto-renews for \$9.99/month until canceled.',
      'fr': '',
    },
    'iljsqtut': {
      'en': 'Upgrade to Premium',
      'fr': '',
    },
    '63s53spz': {
      'en': 'Restore purchases',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'p85ny83o': {
      'en':
          'Autorisez l’accès à l’appareil photo pour capturer des photos pendant l’activité.',
      'fr':
          'Autorisez l’accès à l’appareil photo pour capturer des photos pendant l’activité.',
    },
    'qss01arm': {
      'en':
          'Autorisez l’accès à votre galerie pour sélectionner et ajouter des photos à l’activité.',
      'fr':
          'Autorisez l’accès à votre galerie pour sélectionner et ajouter des photos à l’activité.',
    },
    '6jw153z7': {
      'en': '',
      'fr': '',
    },
    '7p79zddg': {
      'en': '',
      'fr': '',
    },
    'bm3ytdq1': {
      'en':
          'Autorisez la localisation pour suivre votre parcours avec précision pendant l\'activité.',
      'fr':
          'Autorisez la localisation pour suivre votre parcours avec précision pendant l\'activité.',
    },
    'm0i0smtu': {
      'en': 'Utilisé pour localiser votre position.',
      'fr': 'Utilisé pour localiser votre position.',
    },
    '2voaiewh': {
      'en': 'Pour le suivi même en arrière-plan.',
      'fr': 'Pour le suivi même en arrière-plan.',
    },
    'avct3aji': {
      'en': 'Nécessaire pour suivre votre trajet en activité.',
      'fr': 'Nécessaire pour suivre votre trajet en activité.',
    },
    'rlrryjxn': {
      'en': 'Pour suivre l’activité même en fond.',
      'fr': 'Pour suivre l’activité même en fond.',
    },
    'h9f52a8z': {
      'en': 'Pour l’enregistrement continu de votre parcours.',
      'fr': 'Pour l’enregistrement continu de votre parcours.',
    },
    'wrcy873d': {
      'en': 'Utilisé pour compter vos pas pendant l\'activité',
      'fr': 'Utilisé pour vos compter pas pendant l\'activité',
    },
    'cl8z21jv': {
      'en': 'Utilisé pour compter vos pas pendant l\'activité',
      'fr': 'Utilisé pour vos compter pas pendant l\'activité',
    },
    'uo6gn2a6': {
      'en': 'Pour l\'accès aux capteurs corporels',
      'fr': '',
    },
    '06j02gqb': {
      'en': 'Utiliser pour lire vos données Apple Santé.',
      'fr': '',
    },
    'ov5xsi9u': {
      'en':
          '\tUtiliser pour synchroniser vos données santé avec l’application.',
      'fr': '',
    },
    'e53x6tpn': {
      'en': '',
      'fr': '',
    },
    'ccct6ij4': {
      'en': '',
      'fr': '',
    },
    'ff242oi8': {
      'en': '',
      'fr': '',
    },
    'm0rtx1pt': {
      'en': '',
      'fr': '',
    },
    '4eq1omxp': {
      'en': '',
      'fr': '',
    },
    'x8x83acx': {
      'en': '',
      'fr': '',
    },
    '4yexh5tf': {
      'en': '',
      'fr': '',
    },
    'qej12384': {
      'en': '',
      'fr': '',
    },
    'q9qoaty3': {
      'en': '',
      'fr': '',
    },
    'nhrdn5oy': {
      'en': '',
      'fr': '',
    },
    '90g1ss6z': {
      'en': '',
      'fr': '',
    },
    'e08qikzq': {
      'en': '',
      'fr': '',
    },
    '243wc6rl': {
      'en': '',
      'fr': '',
    },
    'gq8xthjm': {
      'en': '',
      'fr': '',
    },
    '8v98q7mp': {
      'en': '',
      'fr': '',
    },
    'njq5toph': {
      'en': '',
      'fr': '',
    },
    'mxtzzeko': {
      'en': '',
      'fr': '',
    },
    '6qd55pnu': {
      'en': '',
      'fr': '',
    },
    'x09f75hz': {
      'en': '',
      'fr': '',
    },
    'uwyily3i': {
      'en': '',
      'fr': '',
    },
    'rky5fk2z': {
      'en': '',
      'fr': '',
    },
    'wo8e4xyx': {
      'en': '',
      'fr': '',
    },
    '8hghrf3m': {
      'en': '',
      'fr': '',
    },
    'k1trid0u': {
      'en': '',
      'fr': '',
    },
    'j8iruszq': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
