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
    'wojb60c6': {
      'en': 'Duration',
      'fr': 'Durée',
    },
    'v5znqu7y': {
      'en': 'Distance',
      'fr': 'Distance',
    },
    '41eub9tl': {
      'en': 'Step',
      'fr': 'Étape',
    },
    '2uvpm3it': {
      'en': 'Step',
      'fr': 'Étape',
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
    '1ui95q7q': {
      'en': 'Birthdate',
      'fr': 'Date de naissance',
    },
    '9lykncxq': {
      'en': 'Your Birthdate',
      'fr': 'Votre date de naissance',
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
    'ms6z2d8i': {
      'en': 'TextField',
      'fr': 'Champ de texte',
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
    'n02vqww1': {
      'en': 'Facebook',
      'fr': 'Facebook',
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
    'd6ufageb': {
      'en': 'Health Alerts',
      'fr': 'Alertes sanitaires',
    },
    'r54onir7': {
      'en': 'Set up health monitoring and reminders',
      'fr': 'Configurer la surveillance de la santé et les rappels',
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
    'kiuikx4v': {
      'en': 'TextField',
      'fr': 'Champ de texte',
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
      'fr': 'accepter le',
    },
    'p66j5q6c': {
      'en': 'Terms of Service',
      'fr': 'Conditions d\'utilisation',
    },
    'bwumualg': {
      'en': ' and ',
      'fr': 'et',
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
    '197fmvhm': {
      'en': 'Facebook',
      'fr': 'Facebook',
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
    'v9rgg8cr': {
      'en': 'Avg. Pace',
      'fr': 'Rythme moyen',
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
