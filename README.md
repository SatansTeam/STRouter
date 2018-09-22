# STRouter

灵活、轻量级的 iOS Router

[img0](https://github.com/SatansTeam/STRouter/blob/master/resource/st-0.png)

### 近期迭代规划
##### 1、增加url调用支持，便于使用openURL:通过scheme直接打开某个界面
##### 2、增加非Native(Weex、RN)调用支持，便于非Native调用Native方法

## 使用
从模块A跳转到模块B的ViewController
```objc
UIViewController *vc = [[STRouter router] st_performClassAction:@"new" target:@"ModuleB_xxxViewController"];
// 配置ModuleB_xxxViewController的属性
[obj_b optimizedOCSetValue:pid ?: @"" forKey:@"pid"];
[self.navigationController pushViewController:vc animated:YES];
```

从模块A调用模块B的Class方法
```objc
NSDictionary *infoDic = @{};
STRouterValue *result = [[STRouterValue router] st_performClassAction:@"ModuleB_ClassB_ClassMethodB:" target:@"ModuleB_ClassB" params:STRouterBridgingRetain(infoDic), nil];
```

从模块A调用模块B的ModuleB_ClassB类的对象方法
```objc
NSDictionary *infoDic = @{};
NSInteger param1 = 11;
NSObject *param2 = NSObject.new;
STRouterValue *result = [[STRouterValue router] st_performAction:@"ModuleB_ClassB_InstanceMethodB:param1:param2:" target:@"ModuleB_ClassB" shouldCacheTarget:NO params:STRouterBridgingRetain(infoDic), &param1, STRouterBridgingRetain(param2), nil];
```

模块A使用模块B的Model
```objc
NSObject *obj_b = [[STRouter router] performClassAction:@"new" target:@"ModuleB_xxxModelB"];
// 配置ModuleB_xxxModelB的属性
NSString *fileName = @"123.txt";
NSInteger len = 63234;
[obj_b optimizedOCSetValue:fileName ?: @"" forKey:@"fileName"];
[obj_b optimizedCSetValue:&len forKey:@"fileLength"];

NSObject *param1 = NSObject.new;
STRouterValue *result = [[STRouterValue router] st_performClassAction:@"ModuleB_ClassB_ClassMethodB:param1:" target:@"ModuleB_ClassB" params:STRouterBridgingRetain(obj_b), STRouterBridgingRetain(param1), nil];
```

从模块A调用模块B的ModuleB_ClassB的Class方法的返回值（ModuleB_ClassT）的方法
```objc
NSInteger param1 = 11;
NSObject *param2 = NSObject.new;
NSObject *ModuleB_ClassT_Instance = [[STRouterValue router] st_performAction:@"ModuleB_ClassB_InstanceMethodB:param1:" target:@"ModuleB_ClassB" shouldCacheTarget:NO params:&param1, STRouterBridgingRetain(param2), nil];

STRouterValue *result = [ModuleB_ClassT_Instance st_performSelector:NSSelectorFromString(@"ModuleB_ClassT_InstanceMethodT:param1:param2:") arguments:STRouterBridgingRetain(param0), &param1, STRouterBridgingRetain(param2), nil];
// ModuleB_ClassT_InstanceMethodT:param1:param2: 的返回值是CGFloat
CGFloat res = result.floatValue;
```

## 协议

STRouter 被许可在 MIT 协议下使用。查阅 [LICENSE](https://github.com/SatansTeam/STRouter/blob/master/LICENSE) 文件来获得更多信息。

















