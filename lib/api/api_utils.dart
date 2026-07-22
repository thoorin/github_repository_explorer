T enumFromInt<T>(int statusCode, Map<T, int> statusPairs) =>
    statusPairs.entries.firstWhere((entry) => entry.value == statusCode).key;

int? enumToInt<T>(T enumStatusCode, Map<T, int> statusPairs) => statusPairs[enumStatusCode];
