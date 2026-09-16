@IsTest
private class CasePriorityServiceTest {

    @IsTest
    static void testDefaultPriority() {

        Test.startTest();

        String priority =
            CasePriorityService.determinePriority('Low');

        Test.stopTest();

        System.assertEquals('Low', priority);
    }

    @IsTest
    static void testUpdateCasePriority() {

        Case c = new Case(
            Subject = 'Test Case',
            Type = 'Question'
        );

        Test.startTest();

        CasePriorityService.updateCasePriority(
            new List<Case>{ c }
        );

        Test.stopTest();

        System.assertNotEquals(
            null,
            c.Priority
        );
    }
}