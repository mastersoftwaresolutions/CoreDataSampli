//
//  FirstViewController.m
//  Coredata Sample
//
//  Created by ravi kumar on 05/11/14.
//  Copyright (c) 2014 Venki. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor blackColor];
    
    textfield1=[[UITextField alloc] initWithFrame:CGRectMake(50, 100, 220, 30)];
    textfield1.backgroundColor=[UIColor whiteColor];
    textfield1.placeholder=@"Name";
    [self.view addSubview:textfield1];
    
    textfield2=[[UITextField alloc] initWithFrame:CGRectMake(50, 140, 220, 30)];
    textfield2.backgroundColor=[UIColor whiteColor];
    textfield2.placeholder=@"Vesrion";
    [self.view addSubview:textfield2];
    
    textfield3=[[UITextField alloc] initWithFrame:CGRectMake(50, 180, 220, 30)];
    textfield3.backgroundColor=[UIColor whiteColor];
    textfield3.placeholder=@"Company";
    [self.view addSubview:textfield3];
    
    UIButton *SaveBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SaveBtn.frame=CGRectMake(100, 220, 120, 30);
    [SaveBtn setTitle:@"Save" forState:UIControlStateNormal];
    [SaveBtn setBackgroundColor:[UIColor blueColor]];
    [SaveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SaveBtn addTarget:self action:@selector(SaveBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SaveBtn];
    
    UIButton *ListBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    ListBtn.frame=CGRectMake(100, 260, 120, 30);
    [ListBtn setTitle:@"List" forState:UIControlStateNormal];
    [ListBtn setBackgroundColor:[UIColor blueColor]];
    [ListBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ListBtn addTarget:self action:@selector(ListBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ListBtn];
}
-(void)SaveBtnClicked:(UIButton *)sender
{
    
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    //Initializing the context
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Devices" inManagedObjectContext:context];
    [newDevice setValue:textfield1.text forKey:@"name"];
    [newDevice setValue:textfield2.text forKey:@"version"];
    [newDevice setValue:textfield3.text forKey:@"company"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    textfield1.text=@"";
    textfield2.text=@"";
    textfield3.text=@"";
}
-(void)ListBtnClicked:(UIButton *)sender
{
    ListViewController *listView=[[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil];
    [self.navigationController pushViewController:listView animated:YES];
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
