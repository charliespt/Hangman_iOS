//
//  ViewController.m
//  Hangman
//
//  Created by Charlie on 2/27/14.
//  Copyright (c) 2014 Charlie. All rights reserved.
//

#import "ViewController.h"
#import "HangmanGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userInput;
@property (weak, nonatomic) IBOutlet UILabel *wordView;
@property (strong, nonatomic) IBOutlet UIImageView *currentImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    hangmanGame = [[HangmanGame alloc] init];
    [_wordView setText: [hangmanGame currentView]];
    [self showHangmanPicture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getUserinput:(id)sender
{
    NSString* input = [[_userInput text] uppercaseString];
    if (![hangmanGame checkInput:input]) {
        NSString* alertMessage = [NSString stringWithFormat:@"The input must be a character!"];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Wrong Input!" message: alertMessage delegate:self cancelButtonTitle:@"Retry" otherButtonTitles: nil];
        [alert show];
    }
    if ([hangmanGame isGuessed:input] && (![input  isEqual: @""])) {
        NSString* alertMessage = [NSString stringWithFormat:@"You have already guessed this character."];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Guessed Already!" message: alertMessage delegate:self cancelButtonTitle:@"Continue" otherButtonTitles: nil];
        [alert show];
    }
    [hangmanGame isRight:input];
    [_wordView setText: [hangmanGame currentView]];
    [self showHangmanPicture];
    [self gameOver];
    [self didWin];
}

-(void)gameOver
{
    if ([hangmanGame lost])
    {
    NSString* alertMessage = [NSString stringWithFormat:@"The answer is: \n %@", [hangmanGame current]];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"GameOver!" message: alertMessage delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];
    }
}

-(void)didWin
{
    if ([hangmanGame win])
    {
        NSString* alertMessage = [NSString stringWithFormat:@"You are right! The answer is: \n %@", [hangmanGame current]];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Congratulation!" message: alertMessage delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    }
}

- (void)showHangmanPicture
{
    _currentImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"HangmanPic%d.gif", [hangmanGame numWrong]]];
    
}


- (IBAction)reset:(id)sender
{
    [hangmanGame reset];
    [_userInput setText:@""];
    [self viewDidLoad];
}

- (IBAction)showanswer:(id)sender
{
    _currentImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"HangmanPic%d.gif", 7]];
    [self showHangmanPicture];
    [_wordView setText:[hangmanGame answer]];
}


@end
