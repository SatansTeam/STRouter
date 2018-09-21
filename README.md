# STRouter

灵活、轻便的 iOS Router

### 近期迭代规划
##### 1、增加url调用支持，便于使用openURL:通过scheme直接打开某个界面
##### 2、增加非Native(Weex、RN)调用支持，便于非Native调用Native方法

## 使用
```objc
// 从模块A跳转到模块B的ViewController
UIViewController *vc = [[STRouter router] st_performClassAction:@"new" target:@"ModuleB_xxxViewController"];
// 配置ModuleB_xxxViewController的属性
[obj_b optimizedOCSetValue:pid ?: @"" forKey:@"pid"];
[self.navigationController pushViewController:vc animated:YES];
```

```objc
// 从模块A调用模块B的Class方法
NSDictionary *infoDic = @{};
STRouterValue *result = [[STRouterValue router] st_performClassAction:@"ModuleB_ClassB_ClassMethodB:" target:@"ModuleB_ClassB" params:STRouterBridgingRetain(infoDic), nil];
```

```objc
// 从模块A调用模块B的ModuleB_ClassB类的对象方法
NSDictionary *infoDic = @{};
STRouterValue *result = [[STRouterValue router] st_performClassAction:@"ModuleB_ClassB_InstanceMethodB:" target:@"ModuleB_ClassB" params:STRouterBridgingRetain(infoDic), nil];
```


```objc
// 模块A使用模块B的Model
NSObject *obj_b = [[STRouter router] performClassAction:@"new" target:@"ModuleB_xxxModelB"];
// 配置ModuleB_xxxModelB的属性
NSString *fileName = @"123.txt";
NSInteger len = 63234;
[obj_b optimizedOCSetValue:fileName ?: @"" forKey:@"fileName"];
[obj_b optimizedCSetValue:&len forKey:@"fileLength"];

```








## 协议

STRouter 被许可在 MIT 协议下使用。查阅 [LICENSE](https://github.com/SatansTeam/STRouter/blob/master/LICENSE) 文件来获得更多信息。

















