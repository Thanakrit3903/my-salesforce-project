@IsTest
private class SampleServiceTest {
    @IsTest
    static void testGetGreeting() {
        System.assertEquals('Hello from CI/CD', SampleService.getGreeting());
    }
}