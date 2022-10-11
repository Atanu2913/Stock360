bool checkApiResponseSuccessOrNot(Map<String, dynamic> jsonData) {
  if (jsonData["success"].toString().toLowerCase() == "true") {
    return true;
  } else {
    return false;
  }
}
