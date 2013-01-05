//
//  AppDelegate.m
//  PushNotification
//
//  Created by Rafael Brigagão Paulino on 29/10/12.
//  Copyright (c) 2012 com.rafapaulino. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

//este é o método acionado quando o aplicativo abre
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    /*
     * Perguntar para o usuário se ele deseja receber um PushNotification 
     * e pedir para registrar o token do aparelho no servidor da Apple
     * Manda um alerta, ou um som, ou um sinalizador (bolinha vermelha com o número)
     */
    [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    
    //quando a aplicação estiver fechada e for aberta por um PushNotification, captamos os dados do push em forma de dicionário
    NSDictionary *pushInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    if (pushInfo != nil)
    {
        NSLog(@" informações vindas por push notification: %@ ",pushInfo.description);
    }
    else
    {
        NSLog(@"Os dados do push notification estão vazios!");
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//método acionado quando o app fica ativo, quando o app abre e quando volta do background
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //retirando a label vermelha do ícone do aparelho
    application.applicationIconBadgeNumber = 0;
    application.applicationIconBadgeNumber = application.applicationIconBadgeNumber+1;

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark Métodos Exclusivos Push Notification

//método acionado caso o usuário tenha aceitado receber PushNotification e o seu Token já esteja cadastrado no servidorda Apple
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //acessa o nosso servidor pessoal para salvar o Token do usuário no nosso banco
    NSLog(@"Aceitou e já está registrado o token: %@", deviceToken);
}

//método acionado quando o usuário aceita receber PushNotiication, porém o cadastro no servidor da Apple falhou
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    //aqui neste ponto pedimos para tentar registrar novamente o token do usuário no banco da Apple
    NSLog(@"O registro do Token do usuário no banco da Apple falhou! %@", error.description);
}

//método acionado quando recebemos um PushNotification e o nosso app está aberto ou em background
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"Recebi um PushNotification %@", userInfo.description);
}


@end
