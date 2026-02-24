trigger AccountTrigger on Account (before insert, before update) {
    // เรียกใช้ Logic จาก Class ที่เราเขียนแยกไว้
    AccountService.setRatingToHot(Trigger.new);
}