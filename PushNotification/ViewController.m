//
//  ViewController.m
//  PushNotification
//
//  Created by Rafael Brigagão Paulino on 29/10/12.
//  Copyright (c) 2012 com.rafapaulino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


#pragma mark Métodos da Tabela

//número de sessões na tabela
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//número de linhas na tabela
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//método responsável por criar a tabela (células)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idCelula = @"minhaCelula";
    
    //fazendo a reciclagem da célula
    UITableViewCell *celula = [_tabela dequeueReusableCellWithIdentifier:idCelula];
    
    //Houve reciclagem?
    if (celula == nil)
    {
        //se não houve reciclagem então será criada uma célula
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idCelula];
    }
    
    //configurar a célula
    
    
    return celula;
}

@end
