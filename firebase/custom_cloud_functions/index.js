const admin = require("firebase-admin/app");
admin.initializeApp();

const fetchCanitrailEvents = require("./fetch_canitrail_events.js");
exports.fetchCanitrailEvents = fetchCanitrailEvents.fetchCanitrailEvents;
