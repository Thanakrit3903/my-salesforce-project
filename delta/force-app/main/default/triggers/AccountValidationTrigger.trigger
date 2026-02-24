trigger AccountValidationTrigger on Account (before insert, before update, before delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            AccountService.setRatingToHot(Trigger.new);
        }
        if (Trigger.isDelete) {
            AccountValidationHandler.preventDeleteActiveAccounts(Trigger.old);
        }
    }
}