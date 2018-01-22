//
//  ViewController.m
//  PeticionesPorProtocolo
//
//  Created by PROIMA on 22/1/18.
//  Copyright © 2018 Copanonga. All rights reserved.
//

#import "ViewController.h"
#import "Peticiones.h"
#import "Linea.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	
	NSLog(@"\nViewController");
	[super viewDidLoad];
	
	[self getDatosPorProtocolo];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - Protocolos

-(void)getDatosPorProtocolo {
	
	Peticiones *peticiones = [[Peticiones alloc] init];
	peticiones.delegate = self;
	[peticiones getDatos];
	[peticiones getInfo];
	
}

-(void) getDatosPeticion: (NSString *) texto {
	NSLog(@"\nTexto datos petición: %@", texto);
}

-(void)getInfoBuses: (NSMutableArray *) listadoLineasProtocolo {
	
	NSMutableArray *listadoLineas = [[NSMutableArray alloc] init];
	listadoLineas = listadoLineasProtocolo;
	
	for (Linea *linea in listadoLineas) {
		NSLog(@"%@",[[Linea alloc] lineaToString:linea]);
	}
	
}

-(void)showError: (NSString *) texto {
	
	NSLog(@"\nMostrar error: %@", texto);
	
}

@end
