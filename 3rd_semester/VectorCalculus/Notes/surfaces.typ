#import "@preview/ctheorems:1.1.3": *
#import "@preview/plotst:0.2.0": *
#show: thmrules.with(qed-symbol: $square$)

#set heading(numbering: "1.1.")
#set page(numbering: "1")
#set heading(numbering: "1.")
#set math.equation(
  numbering: "1",
  supplement: none,
)
#show ref: it => {
  // provide custom reference for equations
  if it.element != none and it.element.func() == math.equation {
    // optional: wrap inside link, so whole label is linked
    link(it.target)[eq.~(#it)]
  } else {
    it
  }
}

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#ffeeee")) //theorem color
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: "1.")
#let proof = thmproof("proof", "Proof")

#align(center, text(21pt)[
  Surfaces - Lecture (number of the lecture)
])

#align(center, text(17pt)[
  Arthur Rabello Oliveira

  #datetime.today().display("[day]/[month]/[year]")
])

= Basics

#definition[(Parametrized Surface)
  A _surface_ is a function $phi: D subset RR^2 -> RR^3$. $phi$ is called the parametrization of the surface, and can be seen as:

  $
    phi(u,v) = (x(u,v), y(u,v), z(u,v))
  $
  
  And if the following exist and are continuous, then $phi$ is of class $C^m$:
  
  $
  (diff^m phi) / (diff x^m) " and " (diff^m phi) / (diff y^m)
  $ 
]

#definition[(Revolution Surface)
  $S$
]

= Area of a Surface

#definition[(Area of a Surface)
  Given $phi: D subset RR^2 -> RR^3$ a $C^1$ class surface with parametrization $phi$, to find the area, divide $D$ into infinitely man small rectangles, such that the associated portions of the surface are close enough to a paralellogram. And let $(u, u + delta u) times (v, v + delta v)$ be one of these rectangles in the plane $u v$, so the  portion of the surface associated is a paralellogram with sides approximated by the vectors $a = phi(u + delta u, v) - phi(u,v)$ and $b = phi(v, delta + v) - phi(u, v)$. So the area of the paralellogram is $||a times b||$:

  $
    A(S) = norm((phi(u , u + delta u) - phi(u, v)) / (delta u) times (phi(v , v + delta v) - phi(u, v)) / (delta v)) delta u dot delta v
  $

  On the limit $delta u -> 0$ and $delta v -> 0$, these are the partial derivatives, so area of $S = phi(D)$ is: 

  $
    A(S) = integral.double_D norm((diff phi) / (diff x) times (diff phi) / (diff y)) 
  $
]

Here are some examples:

#example[

]

#example[

]

#example[

]

= Scalar Surface Integrals

#definition[
  Given $phi: D subset RR^2 -> RR^3$ a parametrized $phi(u, v) = (x(u, v), y(u, v), z(u, v))$ surface, with $S = phi(D)$ and $f: S subset RR^3 -> RR$ a continuous real function in $S$, we are interested on the integral of $f$ along $S = phi(D)$, which is:
  
  $
    integral.double_S f d S = integral.double_D f(phi(u, v)) norm((diff phi) / (diff u) times (diff phi) / (diff v)) d u d v 
  $
]

Notice that when $f = 1$, the surface integral becomes the area of the surface. Here are some examples:

#example[

]

#example[

]



= Tangent Plane to a Surface

Given $S$ a $C^1$ class surface with parametrization $phi$, and $p_0 in S$, we are interested on the _tangent plane_ to $S$ in $p_0$. We could find it by finding 2 independent vectors to $S$ leaving $p_0$. 

Let $p_0 = phi(u_0, v_0)$, we know that th partial derivatives point to the direction that the surface grows (when $u$ or $v$ are fixed), so $v_1 = (diff phi) / (diff u) (u_0, v_0)$ and $v_2 = (diff phi) / (diff v) (u_0, v_0)$ are 2 independent vectors and tangent to the surface in $p_0$, therefore the normal vector generated by $v_i$ generates the plane, so:

#definition[
  The plane tangent to a $C^1$ class surface $S$, parametrized by $phi$ is:

  $
    norm(v_1 times v_2)
  $

  Where $p_0 = phi(u_0, v_0)$, $v_1 = (diff phi) / (diff u) (u_0, v_0)$ and $v_2 = (diff phi) / (diff v) (u_0, v_0)$
]

= Vector Surface Integrals

Given $S$ a parametrized surface, we want to calculate $integral_S F$ over the vector field $F: RR^3 -> RR^3$, we can interpretate this as:

Imagine $F$ is the speed of a fluid, e.g a river. If we toss a _net_ to this river, it will form a surface over the river (the field), so $integral_S F$ quantifies #text(weight: "bold")[how much of the fluid is flowing through the net], or how much of the vector field is flowing through the surface.    