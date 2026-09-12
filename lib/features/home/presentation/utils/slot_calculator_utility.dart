class SlotCalculatorUtility {
  static ({List<int?> slots, int? r1ToStore}) calculateActiveSlots(
    int total,
    int daysPlayed,
    int? lastSlot,
    int daysSinceSaturday,
    int? storedR1,
  ) {
    if (total <= 4) {
      return calculateActiveSlotsForTWoToFourDays(
        total,
        daysPlayed,
        lastSlot,
        daysSinceSaturday,
      );
    } else {
      return calculateActiveSlotsForMoreThanFourDays(
        total,
        daysPlayed,
        lastSlot,
        daysSinceSaturday,
        storedR1,
      );
    }
  }

  static ({List<int?> slots, int? r1ToStore})
  calculateActiveSlotsForMoreThanFourDays(
    int total,
    int daysPlayed,
    int? lastSlot,
    int daysSinceSaturday,
    int? storedR1,
  ) {
    if (daysPlayed == 0 && lastSlot == null) {
      return (
        slots: _getInitialSlotsForMorThanFourDays(daysSinceSaturday, total),
        r1ToStore: null,
      );
    }

    return _getFollowUpSlotsForMoreThanFourDays(
      total,
      daysPlayed,
      lastSlot!,
      daysSinceSaturday,
      storedR1,
    );
  }

  static ({List<int?> slots, int? r1ToStore})
  calculateActiveSlotsForTWoToFourDays(
    int total,
    int daysPlayed,
    int? lastSlot,
    int daysSinceSaturday,
  ) {
    if (daysSinceSaturday == 0) {
      return (slots: _getSaturdaySlots(total), r1ToStore: null);
    }

    if (daysPlayed == 0 && lastSlot == null) {
      return (
        slots: _getInitialSlots(daysSinceSaturday, total),
        r1ToStore: null,
      );
    }

    return (
      slots: _getFollowUpSlots(total, daysPlayed, lastSlot!, daysSinceSaturday),
      r1ToStore: null,
    );
  }

  static List<int?> _getSaturdaySlots(int totall) {
    List<int> activeSlots = [];
    for (int i = 0; i < 6; i = i + 2) {
      activeSlots.add(i);
    }
    return activeSlots.take(totall).toList();
  }

  static List<int?> _getInitialSlots(int daysSinceSaturday, int totall) {
    List<int?> slots = [];
    final currentSlot = daysSinceSaturday + 1;
    for (int i = currentSlot - 1; i <= 6; i = i + 2) {
      slots.add(i);
    }
    return slots.take(totall).toList();
  }

  static List<int?> _getInitialSlotsForMorThanFourDays(
    int daysSinceSaturday,
    int totall,
  ) {
    List<int?> slots = [];
    final currentSlot = daysSinceSaturday + 1;
    final currentSlotIndex = currentSlot - 1;
    final int r1;
    if (totall == 5) {
      r1 = currentSlotIndex + 2;
    } else {
      r1 = currentSlotIndex + 3;
    }
    final r2 = r1 + 1 + 3;

    for (int i = currentSlotIndex; i <= 6; i++) {
      if (i != r1 && i != r2) {
        slots.add(i);
      }
    }
    return slots.take(totall).toList();
  }

  static List<int?> _getFollowUpSlots(
    int total,
    int daysPlayed,
    int lastSlot,
    int daysSinceSaturday,
  ) {
    List<int?> slots = [];
    var currentSlot = daysSinceSaturday + 1;

    if (currentSlot - lastSlot == 1) {
      currentSlot = currentSlot + 1;
    }

    for (int i = currentSlot - 1; i <= 6; i = i + 2) {
      slots.add(i);
    }

    final daysLeft = total - daysPlayed;
    if (daysLeft >= slots.length) {
      return slots;
    }

    return slots.take(daysLeft).toList();
  }

  static ({List<int?> slots, int? r1ToStore})
  _getFollowUpSlotsForMoreThanFourDays(
    int total,
    int daysPlayed,
    int lastSlot,
    int daysSinceSaturday,
    int? storedR1,
  ) {
    final currentSlotIndex = daysSinceSaturday;
    if (lastSlot == currentSlotIndex) {
      // Already finished today's workout; r1 should be computed as if
      // today's play hasn't shifted the streak yet.
      daysPlayed = daysPlayed - 1;
    }

    final int r1;
    int? r1ToStore;

    if (storedR1 != null) {
      r1 = storedR1;
    } else if (total == 5) {
      r1 = currentSlotIndex + (2 - daysPlayed);
      if (daysPlayed == 2) r1ToStore = r1;
    } else {
      r1 = currentSlotIndex + (3 - daysPlayed);
      if (daysPlayed == 3) r1ToStore = r1;
    }

    final r2 = r1 + 4;
    final slots = <int?>[];
    for (int i = currentSlotIndex; i <= 6; i++) {
      if (i != r1 && i != r2) slots.add(i);
    }
    return (slots: slots.take(total).toList(), r1ToStore: r1ToStore);
  }
}
