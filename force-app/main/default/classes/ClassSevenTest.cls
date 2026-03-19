@isTest
private class ClassSevenTest {
    @isTest static void testAdd() {
        Integer result = ClassSeven.add(10, 20);
        Assert.areEqual(200, result);
    }
}