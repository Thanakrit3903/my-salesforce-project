@isTest
private class AccountServiceTest {

    @isTest
    static void testPositiveTechIndustry() {
        // 1. Prepare Data: สร้างข้อมูลจำลองในหน่วยความจำ (ไม่กระทบข้อมูลจริงใน Org)
        Account acc = new Account(
            Name = 'Test Tech Corp',
            Industry = 'Technology'
        );

        // 2. Execute: สั่ง Insert เพื่อให้ Trigger ทำงาน
        Test.startTest();
        insert acc;
        Test.stopTest();

        // 3. Verify: ตรวจสอบว่า Rating เปลี่ยนเป็น Hot จริงไหม
        Account result = [SELECT Rating FROM Account WHERE Id = :acc.Id];
        Assert.areEqual('Hot', result.Rating, 'Rating should be Hot for Technology industry');
    }

    @isTest
    static void testNegativeOtherIndustry() {
        // ทดสอบกรณีที่ไม่ใช่ Technology เพื่อให้มั่นใจว่า Code ไม่ทำงานมั่ว
        Account acc = new Account(
            Name = 'Test Banking Corp',
            Industry = 'Banking'
        );

        Test.startTest();
        insert acc;
        Test.stopTest();

        Account result = [SELECT Rating FROM Account WHERE Id = :acc.Id];
        Assert.areNotEqual('Hot', result.Rating, 'Rating should NOT be Hot for Banking');
    }
}