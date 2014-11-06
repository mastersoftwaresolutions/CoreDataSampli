//
//  ListViewController.m
//  Coredata Sample
//
//  Created by ravi kumar on 05/11/14.
//  Copyright (c) 2014 Venki. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    //Initialize the Conetext
    NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Devices"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    tableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568) style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.devices.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:nil];
    cell.backgroundColor=[UIColor redColor];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    UILabel *devicelabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 180, 50)];
    devicelabel.backgroundColor=[UIColor clearColor];
    NSString *string=[[NSString alloc] initWithFormat:@"%@ %@",[[self.devices valueForKey:@"name"] objectAtIndex:indexPath.row],[[self.devices valueForKey:@"version"] objectAtIndex:indexPath.row]];
    devicelabel.text=string;
    [cell.contentView addSubview:devicelabel];
    
    UILabel *Companylabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 0, 110, 50)];
    Companylabel.text=[[self.devices valueForKey:@"company"] objectAtIndex:indexPath.row];
    Companylabel.textAlignment=NSTextAlignmentRight;
    Companylabel.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:Companylabel];
    
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
