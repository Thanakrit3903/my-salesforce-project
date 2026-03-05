@isTest
private class ClassFourTest {
    @isTest static void testValid() {
        Boolean res = ClassFour.isValid('Hello');
        Assert.isTrue(res);
    }
}