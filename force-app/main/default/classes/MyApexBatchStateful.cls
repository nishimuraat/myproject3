global class MyApexBatchStateful  implements Database.Batchable<SObject>,Database.Stateful
{
    global integer numberOfDirectCustomers=0;
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        System.debug('-----------1');
        String query='select id,name,AccountNumber,Type from account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC,List<Account> accList)
    {
        for(account acc:accList)
        {
            if('Customer - Direct'.equals(acc.type))
            {
                numberOfDirectCustomers++;
            }
        }
    }
    global void finish(Database.BatchableContext BC)
    {
        System.debug('account with type customer-direct '+numberOfDirectCustomers);
    }
}