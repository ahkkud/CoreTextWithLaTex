//
//  rectView.m
//  LatexString
//
//  Created by zhangyang on 16/8/26.
//  Copyright © 2016年 zhangyang. All rights reserved.
//

#import "rectView.h"
#include "latex.h"


@implementation rectView
- (void)drawRect:(CGRect)rect
{
    
    self.backgroundColor = [UIColor clearColor];
    //使用Core Graphics的函数在context上绘制，Core Graphics的函数需要context作为参数，只绘制在指定使用的context上
    //功过UIGraphicsGetCurrentContext函数获取当前上下文栈顶的context，UIView系统已为其准备好context并存放在栈顶了
        CGContextRef context = UIGraphicsGetCurrentContext();
    
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    CGContextTranslateCTM(context, 0, self.bounds.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
    
    //在context上绘制
        CGContextFillPath(context);
    
    // Load required resources
    LaTeX::init();
    // The LaTeX formatted string to parse
    
    //    wstring ltx = L"\\left|I_{2}\\right|=\\left|\\int_{a}^{b}\\psi\\left(t\\right)\\left\\{\\mu\\left(a,t\\right)-\\int_{\\gamma\\left(t\\right)}^{a}\\right\\}\\right\\sum_{i=1}^n a_i=0| ";此方程ok
    
    //    wstring ltx = L"\\begin{pmatrix} a_{11} & \\cdots & a_{1n} \\\\ \\vdots & \\ddots & \\vdots \\\\ a_{m1} & \\cdots & a_{mn}\\end{pmatrix}";矩阵ok
    
        wstring ltx = L"\\\\2H_2 + O_2 \\xrightarrow{n,m}2H_2OA\\underset{b}{\\overset{a}{\\longleftrightarrow}}B";//物理公式ok
    
    //    wstring ltx = L"\\psi (t)=\\hat{\\psi}e^{i(\\omega t\\, \\pm\\, \\theta)}    \\sum_i \\hat{\\psi_i} cos(\\alpha_i \\pm \\omega t)";//物理公式2ok
    
    //    wstring ltx = L"\\\\A\\underset{0^{\\circ}C }{\\overset{100^{\\circ}C}{\\rightleftarrows}}B";//化学公式ok
    
//        wstring ltx = L"\\bigcap_{i=1}^{n}{X_i}";//集合公式ok
    
    //wstring ltx = L"\\alpha \\beta \\gamma \\delta \\epsilon \\varepsilon \\zeta \\eta \\theta \\vartheta \\iota \\kappa \\lambda \\mu \\nu \\xi \\pi \\varpi \\rho \\varrho \\sigma \\varsigma \\tau \\upsilon \\phi \\varphi \\chi \\psi \\omega";
    
//    wstring ltx = L"\\\\x = a_0 + \\frac{1}{a_1 + \\frac{1}{a_2 + \\frac{1}{a_3 + a_4}}} \\ \\bigcap_{i=1}^{n}{X_i} \\ A\\underset{0^{\\circ}C }{\\overset{100^{\\circ}C}{\\rightleftarrows}}B \\begin{pmatrix} a_{11} & \\cdots & a_{1n} \\\\ \\vdots & \\ddots & \\vdots \\\\ a_{m1} & \\cdots & a_{mn}\\end{pmatrix}\\vec{F}=m \\frac{d \\vec{v}}{dt} + \\vec{v}\\frac{dm}{dt}  \\\\\\psi (t)=\\hat{\\psi}e^{i(\\omega t\\, \\pm\\, \\theta)}    \\sum_i \\hat{\\psi_i} cos(\\alpha_i \\pm \\omega t)  \\\\ \\vec{F}=m \\frac{d \\vec{v}}{dt} + \\vec{v}\\frac{dm}{dt}  \\\\ \\vec{F}=m \\frac{d \\vec{v}}{dt} + \\vec{v}\\frac{dm}{dt}";//集合公式ok

    TeXRender* render = LaTeX::parse(ltx,
                                     // Logical width of the 2D-graphics context
                                     self.bounds.size.width,
                                     // Font size
                                     13,
                                     // Line space
                                     0,
                                     // Foreground color
                                     0xff000000);
    
    Graphics2D g2d(context);
    // Draw the generated formula on 2D-graphics context
    render->draw(g2d,/*Left position*/0,/*Top position*/0);
    // Remember to delete the render
    
    delete render;

}

@end
