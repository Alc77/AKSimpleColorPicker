//
//  AKRoughColorPickerView.m
//  AKSimpleColorPicker
//
//  Created by Alex Korabl'ov on 17.05.2018.
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <GLKit/GLKit.h>
#import "AKRoughColorPickerShader.h"
#import "AKRoughColorPickerShader.fsh.h"
#import "AKRoughVertexShader.vsh.h"

static GLfloat const AKBaseShaderQuad[8] = {
	-1.f, -1.f,
	-1.f, +1.f,
	+1.f, -1.f,
	+1.f, +1.f,
};

@interface AKRoughColorPickerShader ()

// Program Handle
@property (assign, nonatomic, readonly) GLuint program;

// Attribute Handles
@property (assign, nonatomic, readonly) GLuint aPosition;

// Uniform Handles
@property (assign, nonatomic, readonly) GLuint uResolution;
@property (assign, nonatomic, readonly) GLuint uTouch;
@property (assign, nonatomic, readonly) GLuint uPickerWidth;

@end

@implementation AKRoughColorPickerShader
{
	float scale;
}

#pragma mark - init

- (instancetype)initWithVertexShader:(NSString*)vsh fragmentShader:(NSString*)fsh {
	self = [super init];
	if (self) {
		
		// Program
		_program = [self programWithVertexShader:vsh fragmentShader:fsh];
		
		// Attributes
		_aPosition = glGetAttribLocation(_program, "aPosition");
		
		// Uniforms
		_uResolution = glGetUniformLocation(_program, "uResolution");
		_uTouch = glGetUniformLocation(_program, "uTouch");
		_uPickerWidth = glGetUniformLocation(_program, "uPickerWidth");
		
		scale = 1.0;
		if([[UIScreen mainScreen]respondsToSelector:@selector(scale)]) {
			scale = [[UIScreen mainScreen] scale];
		}
		
		// Configure OpenGL ES
		[self configureOpenGLES];
	}
	return self;
}

- (GLuint)programWithVertexShader:(NSString*)vsh fragmentShader:(NSString*)fsh {
	// Build shaders
	GLuint vertexShader = [self shaderWithType:GL_VERTEX_SHADER];
	GLuint fragmentShader = [self shaderWithType:GL_FRAGMENT_SHADER];
	
	// Create program
	GLuint programHandle = glCreateProgram();
	
	// Attach shaders
	glAttachShader(programHandle, vertexShader);
	glAttachShader(programHandle, fragmentShader);
	
	// Link program
	glLinkProgram(programHandle);
	
	// Check for errors
	GLint linkSuccess;
	glGetProgramiv(programHandle, GL_LINK_STATUS, &linkSuccess);
	if (linkSuccess == GL_FALSE) {
		GLchar messages[1024];
		glGetProgramInfoLog(programHandle, sizeof(messages), 0, &messages[0]);
		NSLog(@"%@:- GLSL Program Error: %s", [self class], messages);
	}
	
	// Delete shaders
	glDeleteShader(vertexShader);
	glDeleteShader(fragmentShader);
	
	return programHandle;
}

- (void)configureOpenGLES {
	// Program
	glUseProgram(_program);
	
	// Attributes
	glEnableVertexAttribArray(_aPosition);
	glVertexAttribPointer(_aPosition, 2, GL_FLOAT, GL_FALSE, 0, AKBaseShaderQuad);
}

#pragma mark - render

- (void)renderInRect:(CGRect)rect withPos:(CGPoint)position {
	// Uniforms
	glUniform2f(self.uResolution, CGRectGetWidth(rect)*scale, CGRectGetHeight(rect)*scale);
	glUniform2f(self.uTouch, position.x * scale, position.y * scale);
	glUniform1f(self.uPickerWidth, 6.0 * scale);
	
	// Draw
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
}

#pragma mark - private methods

- (GLuint)shaderWithType:(GLenum)type {
	// Load the shader file
	NSString* file;
	if (type == GL_VERTEX_SHADER) {
		file = [NSString stringWithCString:(const char*)AKRoughVertexShader_vsh encoding:NSUTF8StringEncoding];
	} else if (type == GL_FRAGMENT_SHADER) {
		file = [NSString stringWithCString:(const char*)AKRoughColorPickerShader_fsh encoding:NSUTF8StringEncoding];
	}
	
	// Create the shader source
	const GLchar* source = (GLchar*)[file UTF8String];
	
	// Create the shader object
	GLuint shaderHandle = glCreateShader(type);
	
	// Load the shader source
	glShaderSource(shaderHandle, 1, &source, 0);
	
	// Compile the shader
	glCompileShader(shaderHandle);
	
	// Check for errors
	GLint compileSuccess;
	glGetShaderiv(shaderHandle, GL_COMPILE_STATUS, &compileSuccess);
	if (compileSuccess == GL_FALSE) {
		GLchar messages[1024];
		glGetShaderInfoLog(shaderHandle, sizeof(messages), 0, &messages[0]);
		NSLog(@"%@:- GLSL Shader Error: %s", [self class], messages);
	}
	
	return shaderHandle;
}

@end
