//
//  FISViewControllerSpec.m
//  Open-Me
//
//  Created by Al Tyus on 5/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//


#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#import "FISViewController.h"


SpecBegin(FISViewController)

describe(@"FISViewController", ^{
   
   // __block FISViewController *viewController;
    
    beforeAll(^{
        //viewController = [[FISViewController alloc] init];
        
    });
    
    beforeEach(^{
        
    });
    
    it(@"Should have a container view that fills the top half of the screen", ^{
        UIView *bottomContainerView = [tester waitForViewWithAccessibilityLabel:@"topContainerView"];
        CGRect expectedTopContainerFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2.0);
        expect((CGRectEqualToRect(bottomContainerView.frame, expectedTopContainerFrame))).to.beTruthy();
    });
    
    it(@"Should have a container view that fills the bottom half of the screen", ^{
        UIView *bottomContainerView = [tester waitForViewWithAccessibilityLabel:@"bottomContainerView"];
        CGRect expectedBottomContainerFrame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2.0);

        expect(bottomContainerView.frame).to.equal(expectedBottomContainerFrame);
    });
    
    it(@"Should have a bottom container view that has 16 equally sized buttons as subviews in a grid", ^{
        
        UIView *bottomContainerView = [tester waitForViewWithAccessibilityLabel:@"bottomContainerView"];
        
        CGSize expectedSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 4, [UIScreen mainScreen].bounds.size.height/ 2 / 4);
        for (UIButton *button in bottomContainerView.subviews)
        {
            expect(button).to.beKindOf([UIButton class]);
            expect(button.frame.size).to.equal(expectedSize);
        }
        
        UIButton *oneButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"1"];
        UIButton *twoButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"2"];
        UIButton *threeButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"3"];
        UIButton *fourButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"4"];
        UIButton *fiveButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"5"];
        UIButton *sixButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"6"];
        UIButton *sevenButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"7"];
        UIButton *eightButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"8"];
        UIButton *nineButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"9"];
        UIButton *zeroButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"0"];
        UIButton *decimalButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"."];
        UIButton *equalsButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"="];
        UIButton *divideButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"/"];
        UIButton *multiplyButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"x"];
        UIButton *subtractButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"-"];
        UIButton *additionButton = (UIButton *)[tester waitForTappableViewWithAccessibilityLabel:@"+"];
        
        CGFloat row1y = 0;
        CGFloat row2y = expectedSize.height;
        CGFloat row3y = expectedSize.height * 2;
        CGFloat row4y = expectedSize.height * 3;
        
        CGFloat column1x = 0;
        CGFloat column2x = expectedSize.width;
        CGFloat column3x = expectedSize.width * 2;
        CGFloat column4x = expectedSize.width * 3;

        
        
        expect(oneButton.frame).to.equal(CGRectMake(column1x, row1y, expectedSize.width, expectedSize.height));
        expect(twoButton.frame).to.equal(CGRectMake(column2x, row1y, expectedSize.width, expectedSize.height));
        expect(threeButton.frame).to.equal(CGRectMake(column3x, row1y, expectedSize.width, expectedSize.height));
        expect(divideButton.frame).to.equal(CGRectMake(column4x, row1y, expectedSize.width, expectedSize.height));

        expect(fourButton.frame).to.equal(CGRectMake(column1x, row2y, expectedSize.width, expectedSize.height));
        expect(fiveButton.frame).to.equal(CGRectMake(column2x, row2y, expectedSize.width, expectedSize.height));
        expect(sixButton.frame).to.equal(CGRectMake(column3x, row2y, expectedSize.width, expectedSize.height));
        expect(multiplyButton.frame).to.equal(CGRectMake(column4x, row2y, expectedSize.width, expectedSize.height));

        
        expect(sevenButton.frame).to.equal(CGRectMake(column1x, row3y, expectedSize.width, expectedSize.height));
        expect(eightButton.frame).to.equal(CGRectMake(column2x, row3y, expectedSize.width, expectedSize.height));
        expect(nineButton.frame).to.equal(CGRectMake(column3x, row3y, expectedSize.width, expectedSize.height));
        expect(subtractButton.frame).to.equal(CGRectMake(column4x, row3y, expectedSize.width, expectedSize.height));

        expect(zeroButton.frame).to.equal(CGRectMake(column1x, row4y, expectedSize.width, expectedSize.height));
        expect(decimalButton.frame).to.equal(CGRectMake(column2x, row4y, expectedSize.width, expectedSize.height));
        expect(equalsButton.frame).to.equal(CGRectMake(column3x, row4y, expectedSize.width, expectedSize.height));
        expect(additionButton.frame).to.equal(CGRectMake(column4x, row4y, expectedSize.width, expectedSize.height));

        
    });
    
    
    it(@"should have a top container view with a textField pinned 30 pts from the top and a standard distance from the leading and trailing edges", ^{
        
        UITextField *displayTextField = (UITextField *)[tester waitForViewWithAccessibilityLabel:@"displayTextField"];
        
        CGFloat standardSpacing = 20.0;
        CGFloat textFieldIntrinsicHeight = 30.0;
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - (standardSpacing * 2));
        
        CGRect expectedTextFieldFrame = CGRectMake(standardSpacing, 30.0, width, textFieldIntrinsicHeight);
        
        expect(displayTextField.frame).to.equal(expectedTextFieldFrame);
    });
    
    
    afterAll(^{
        
    });
    
    afterEach(^{
        
    });
});
SpecEnd