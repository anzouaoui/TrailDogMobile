const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const cors = require("cors")({ origin: true }); // CORS automatique

exports.fetchCanitrailEvents = functions
  .region("europe-west1")
  .runWith({
    timeoutSeconds: 10,
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    // CORS headers
    res.set("Access-Control-Allow-Origin", "*"); // ou restreint à une URL
    res.set("Access-Control-Allow-Methods", "GET");
    res.set("Access-Control-Allow-Headers", "Content-Type");

    // Répondre aux requêtes préflight (OPTIONS)
    if (req.method === "OPTIONS") {
      return res.status(204).send("");
    }

    if (!context.auth.uid) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Connexion requise",
      );
    }
    // Write your code below!
    try {
      const res = await fetch(
        "https://www.finishers.com/en/tags/canitrail-and-canicross",
      );
      const html = await res.text();

      const eventRegex =
        /<a[^>]*href="(\/en\/events\/[^"]+)"[^>]*>[\s\S]*?<div class="event-card__title">([^<]+)<\/div>[\s\S]*?<div class="event-card__date">([^<]+)<\/div>[\s\S]*?<div class="event-card__location">([^<]+)<\/div>/g;

      const events = [];
      let match;

      while ((match = eventRegex.exec(html)) !== null) {
        const url = "https://www.finishers.com" + match[1];
        const title = match[2].trim();
        const date = match[3].trim();
        const location = match[4].trim();
        events.push({ title, date, location, url, type: "canitrail" });
      }

      return events;
    } catch (err) {
      console.error(err);
      throw new functions.https.HttpsError("internal", "Erreur fetch/scraping");
    }
    // Write your code above!
    return {};
  });
