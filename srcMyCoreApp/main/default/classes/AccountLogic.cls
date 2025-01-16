/**
 * @description Class to handle Account default value automations
 * @author BuildAgent
 * @date 2025-01-16
 */
public with sharing class AccountLogic {
    
    // Constants to store default values
    private static final String DEFAULT_DESCRIPTION = 'Default description';
    private static final String DEFAULT_SITE = 'Single location';
    private static final String DEFAULT_STREET = '111 W Illinois St';
    private static final String DEFAULT_STATE = 'Chicago';
    private static final String DEFAULT_POSTAL = '60654';
    private static final String DEFAULT_PHONE = '9999999';
    private static final String DEFAULT_WEBSITE = 'www.copado.com';
    
    /**
     * @description Sets default description if not already set
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultDescription(Account account) {
        if (account == null) {
            throw new AccountLogicException('Account parameter cannot be null');
        }
        
        if (String.isBlank(account.Description)) {
            account.Description = DEFAULT_DESCRIPTION;
        }
        return account;
    }
    
    /**
     * @description Sets default site location
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultSite(Account account) {
        if (account == null) {
            throw new AccountLogicException('Account parameter cannot be null');
        }
        
        account.Site = DEFAULT_SITE;
        return account;
    }
    
    /**
     * @description Sets default shipping address fields
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultShippingAddress(Account account) {
        if (account == null) {
            throw new AccountLogicException('Account parameter cannot be null');
        }
        
        account.ShippingStreet = DEFAULT_STREET;
        account.ShippingState = DEFAULT_STATE;
        account.ShippingPostalCode = DEFAULT_POSTAL;
        return account;
    }
    
    /**
     * @description Sets default phone number
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultPhone(Account account) {
        if (account == null) {
            throw new AccountLogicException('Account parameter cannot be null');
        }
        
        account.Phone = DEFAULT_PHONE;
        return account;
    }
    
    /**
     * @description Sets default website URL
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultURL(Account account) {
        if (account == null) {
            throw new AccountLogicException('Account parameter cannot be null');
        }
        
        account.Website = DEFAULT_WEBSITE;
        return account;
    }
    
    /**
     * @description Custom exception class for Account Automation errors
     */
    public class AccountLogicException extends Exception {}
}