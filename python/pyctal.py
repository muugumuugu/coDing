#!/usr/bin/env python
# -*- coding: utf-8 -*-


import math
import cairo
import random
import imageio
import os

# alpha = arccos[(b^2 + c^2 − a^2) / 2bc]
# beta = arccos[(a^2 + c^2 − b^2) / 2ac]
# delta = arccos[(a^2 + b^2 − c^2) / 2ab]

class Triangle:
    def __init__(self, xA, yA, xB, yB, xC, yC):
        self.A = (xA, yA)
        self.B = (xB, yB)
        self.C = (xC, yC)

        self.AB = distance(self.A, self.B)
        self.BC = distance(self.B, self.C)
        self.AC = distance(self.A, self.C)

        a = self.BC
        b = self.AC
        c = self.AB

        temp1 = (b*b + c*c - a*a) / (2.0 * b * c)
        temp2 = (a*a + c*c - b*b) / (2.0 * a * c)
        temp3 = (a*a + b*b - c*c) / (2.0 * a * b)

        self.CAB = math.acos(temp1)
        self.ABC = math.acos(temp2)
        self.BCA = math.acos(temp3)

    def resize(self, ratio, angle):
        newA = (self.A[0] * ratio, self.A[1] * ratio)
        newB = (self.B[0] * ratio, self.B[1] * ratio)
        newC = (self.C[0] * ratio, self.C[1] * ratio)

        return Triangle(newA[0], newA[1], newB[0], newB[1], newC[0], newC[1])

    def rotate(self, angle, origin):
        newA = (self.A[0] - origin[0], self.A[1] - origin[1] )
        newB = (self.B[0] - origin[0], self.B[1] - origin[1] )
        newC = (self.C[0] - origin[0], self.C[1] - origin[1] )

        newA = rotatePoint(newA, angle)
        newB = rotatePoint(newB, angle)
        newC = rotatePoint(newC, angle)

        newA = (newA[0] + origin[0], newA[1] + origin[1] )
        newB = (newB[0] + origin[0], newB[1] + origin[1] )
        newC = (newC[0] + origin[0], newC[1] + origin[1] )

        return Triangle(newA[0], newA[1], newB[0], newB[1], newC[0], newC[1])

    def translate(self, dx, dy):
        newA = (self.A[0] + dx, self.A[1] + dy)
        newB = (self.B[0] + dx, self.B[1] + dy)
        newC = (self.C[0] + dx, self.C[1] + dy)

        return Triangle(newA[0], newA[1], newB[0], newB[1], newC[0], newC[1])


    def __str__(self):
        s = "POINTS:\t"
        s += self.A.__str__() + " " + self.B.__str__() + " " + self.C.__str__()
        s += "\nDISTANCES:\t"
        s += self.AB.__str__() + " " + self.BC.__str__() + " " + self.AC.__str__()
        s += "\nANGLES (rad):\t"
        s += self.CAB.__str__() + " " + self.ABC.__str__() + " " + self.BCA.__str__()
        s += "\nANGLES (deg):\t"
        s += math.degrees(self.CAB).__str__() + " " + math.degrees(self.ABC).__str__() + " " + math.degrees(self.BCA).__str__()
        return s


def rotatePoint(point, angle):
    x = point[0]
    y = point[1]

    xprime = x * math.cos(angle) + y * math.sin(angle)
    yprime = -1 * x * math.sin(angle) + y * math.cos(angle)

    return (xprime, yprime)

def distance(A, B):
    (xA, yA) = A
    (xB, yB) = B

    return math.sqrt((xB-xA)*(xB-xA) + (yB-yA)*(yB-yA))

def drawTriangle(ctx, triangle):
    ctx.move_to (triangle.A[0], triangle.A[1])
    ctx.line_to(triangle.B[0], triangle.B[1])

    ctx.move_to (triangle.B[0], triangle.B[1])
    ctx.line_to(triangle.C[0], triangle.C[1])

    ctx.move_to (triangle.C[0], triangle.C[1])
    ctx.line_to(triangle.A[0], triangle.A[1])

def main():
    WIDTH, HEIGHT  = 500, 500

    images = []

    surface        = cairo.ImageSurface (cairo.FORMAT_ARGB32, WIDTH, HEIGHT)
    ctx            = cairo.Context (surface)
    ctx.scale (WIDTH, HEIGHT) # Normalizing the canvas

    ## Create a gradient color background
    # pat = cairo.LinearGradient (0.0, 0.0, 0.0, 1.0)
    # pat.add_color_stop_rgba (1, 0.7, 0, 0, 0.5) # First stop, 50% opacity
    # pat.add_color_stop_rgba (0, 0.9, 0.7, 0.2, 1) # Last stop, 100% opacity
    # ctx.rectangle(0, 0, 1, 1) # Rectangle(x0, y0, x1, y1)
    # ctx.set_source (pat)
    # ctx.fill ()

    # ctx.translate (0.001, 0.001) # Changing the current transformation matrix

    # Define the points of the initial triangle
    A = (0.45    ,     0.45)
    B = (0.55    ,     0.45)
    C = (0.55    ,     0.55)

    A = (random.uniform(0.25, 0.75)   ,     random.uniform(0.25, 0.75))
    B = (random.uniform(0.25, 0.75)   ,     random.uniform(0.25, 0.75))
    C = (random.uniform(0.25, 0.75)   ,     random.uniform(0.25, 0.75))


    # Draw the inital triangle
    triangle = Triangle(A[0], A[1], B[0], B[1], C[0], C[1])

    # Defining the angle and point where to rotate
    rotAngle = triangle.ABC
    rotPoint = triangle.B

    # Draw the rotated triangles
    for _ in range(int(360 / math.degrees(rotAngle))):
        # fils = triangle.rotate(rotAngle, rotPoint)
        fils = triangle.resize(triangle.BC / triangle.AB, rotAngle)
        # fils = triangle.translate(triangle.B[0] - triangle.C[0], triangle.B[1] - triangle.C[1])
        print(fils)
        drawTriangle(ctx, fils)
        triangle = fils


        # Finish the drawing
        ctx.set_source_rgb (0.3, 0.2, 0.5) # Solid color
        ctx.set_line_width (0.002)
        # ctx.set_line_width (0.01)
        ctx.stroke ()

        surface.write_to_png ("example.png") # Output to PNG
        images.append(imageio.imread("example.png"))

    os.remove("example.png")
    kargs = { 'duration' : 1}
    imageio.mimsave('rotation.gif', images, 'GIF', **kargs)

main()