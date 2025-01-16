/**
 * @description Test class for AccountLogic
 * @author BuildAgent
 * @date 2025-01-16
 */
@IsTest
private class AccountLogicTest {
    
    // Test data constants
    private static final String TEST_DESCRIPTION = 'Test Description';
    private static final String TEST_SITE = 'Test Site';
    private static final String TEST_WEBSITE = 'www.test.com';
    
    /**
     * @description Set up test data
     * @return Account Test account record
     */
    private static Account createTestAccount() {
        return new Account(Name = 'Test Account');
    }
    
    /**
     * @description Test setting default description when description is null
     */
    @IsTest
    static void testSetDefaultDescriptionNull() {
        // Given
        Account testAccount = createTestAccount();
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultDescription(testAccount);
        Test.stopTest();
        
        // Then
        Assert.areEqual('Default description', resultAccount.Description, 
            'Description should be set to default value when null');
    }
    
    /**
     * @description Test setting default description when description exists
     */
    @IsTest
    static void testSetDefaultDescriptionExisting() {
        // Given
        Account testAccount = createTestAccount();
        testAccount.Description = TEST_DESCRIPTION;
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultDescription(testAccount);
        Test.stopTest();
        
        // Then
        Assert.areEqual(TEST_DESCRIPTION, resultAccount.Description, 
            'Existing description should not be overwritten');
    }
    
    /**
     * @description Test setting default site
     */
    @IsTest
    static void testSetDefaultSite() {
        // Given
        Account testAccount = createTestAccount();
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultSite(testAccount);
        Test.stopTest();
        
        // Then
        Assert.areEqual('Single location', resultAccount.Site, 
            'Site should be set to default value');
    }
    
    /**
     * @description Test setting default shipping address
     */
    @IsTest
    static void testSetDefaultShippingAddress() {
        // Given
        Account testAccount = createTestAccount();
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultShippingAddress(testAccount);
        Test.stopTest();
        
        // Then
        Assert.areEqual('111 W Illinois St', resultAccount.ShippingStreet, 
            'Shipping street should be set to default value');
        Assert.areEqual('Chicago', resultAccount.ShippingState, 
            'Shipping state should be set to default value');
        Assert.areEqual('60654', resultAccount.ShippingPostalCode, 
            'Shipping postal code should be set to default value');
    }
    
    /**
     * @description Test setting default phone
     */
    @IsTest
    static void testSetDefaultPhone() {
        // Given
        Account testAccount = createTestAccount();
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultPhone(testAccount);
        Test.stopTest();
        
        // Then
        Assert.areEqual('9999999', resultAccount.Phone, 
            'Phone should be set to default value');
    }
    
    /**
     * @description Test setting default URL
     */
    @IsTest
    static void testSetDefaultURL() {
        // Given
        Account testAccount = createTestAccount();
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultURL(testAccount);
        Test.stopTest();
        
        // Then
        Assert.areEqual('www.copado.com', resultAccount.Website, 
            'Website should be set to default value');
    }
    
    /**
     * @description Test null account parameter handling for all methods
     */
    @IsTest
    static void testNullAccountHandling() {
        // Given
        Account nullAccount = null;
        
        // When/Then
        Test.startTest();
        
        try {
            AccountLogic.setDefaultDescription(nullAccount);
            Assert.fail('Should throw exception for null account in setDefaultDescription');
        } catch (AccountLogic.AccountLogicException e) {
            Assert.isTrue(e.getMessage().contains('Account parameter cannot be null'), 
                'Expected null account error message');
        }
        
        try {
            AccountLogic.setDefaultSite(nullAccount);
            Assert.fail('Should throw exception for null account in setDefaultSite');
        } catch (AccountLogic.AccountLogicException e) {
            Assert.isTrue(e.getMessage().contains('Account parameter cannot be null'), 
                'Expected null account error message');
        }
        
        try {
            AccountLogic.setDefaultShippingAddress(nullAccount);
            Assert.fail('Should throw exception for null account in setDefaultShippingAddress');
        } catch (AccountLogic.AccountLogicException e) {
            Assert.isTrue(e.getMessage().contains('Account parameter cannot be null'), 
                'Expected null account error message');
        }
        
        try {
            AccountLogic.setDefaultPhone(nullAccount);
            Assert.fail('Should throw exception for null account in setDefaultPhone');
        } catch (AccountLogic.AccountLogicException e) {
            Assert.isTrue(e.getMessage().contains('Account parameter cannot be null'), 
                'Expected null account error message');
        }
        
        try {
            AccountLogic.setDefaultURL(nullAccount);
            Assert.fail('Should throw exception for null account in setDefaultURL');
        } catch (AccountLogic.AccountLogicException e) {
            Assert.isTrue(e.getMessage().contains('Account parameter cannot be null'), 
                'Expected null account error message');
        }
        
        Test.stopTest();
    }
    
    /**
     * @description Test bulk processing capability
     */
    @IsTest
    static void testBulkProcessing() {
        // Given
        List<Account> testAccounts = new List<Account>();
        for(Integer i = 0; i < 200; i++) {
            testAccounts.add(createTestAccount());
        }
        
        // When
        Test.startTest();
        List<Account> processedAccounts = new List<Account>();
        for(Account acc : testAccounts) {
            processedAccounts.add(AccountLogic.setDefaultDescription(acc));
            processedAccounts.add(AccountLogic.setDefaultSite(acc));
            processedAccounts.add(AccountLogic.setDefaultShippingAddress(acc));
            processedAccounts.add(AccountLogic.setDefaultPhone(acc));
            processedAccounts.add(AccountLogic.setDefaultURL(acc));
        }
        Test.stopTest();
        
        // Then
        for(Account acc : processedAccounts) {
            Assert.isNotNull(acc.Description, 'Description should not be null');
            Assert.isNotNull(acc.Site, 'Site should not be null');
            Assert.isNotNull(acc.ShippingStreet, 'ShippingStreet should not be null');
            Assert.isNotNull(acc.Phone, 'Phone should not be null');
            Assert.isNotNull(acc.Website, 'Website should not be null');
        }
    }
}