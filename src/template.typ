#let template(
  title: "", 
  class: "EME-185A/B", 
  team-number: "17",
  project-name: "Glue Dispensing Jig for Novel Polymer Heat Exchanger Fin Plates", 
  ta-contact: "Angel Rodas",
  professor-contact: "Jon Schofield", 
  authors: (
    (name: "Patrick Abrash", id: "920893423"),
    (name: "Keira Godfrey", id: "920712384"),
    (name: "Leah Anberg Katzen", id: "920763207"),
    (name: "Jason Daniel Pieck", id: "920981652"),
    (name: "Lara V. Tam", id: "921007153"),
    (name: "Peter Webster", id: "920857757"),
  ), 
  page-height: 11in, 
  page-width: 8.5in, 
  columns: 2,
  accent: rgb("#063e7e"),
  body
) = {
  
  // Set the document's basic properties.
  set document(
    author: authors.map(a => a.name), 
    title: [#class #title - Group \##team-number (#project-name) ]
  )
  
  show link: it => underline(text(accent.lighten(10%), it))
  set text(
    font: "IBM Plex Sans", 
    lang: "en",
    size: 12pt,
  )

   show figure.caption: set text(.9em, fill: accent)
  // show figure.caption.where(body: []): it => it.supplement + [ ] + context it.counter.display()

  show heading.where(level: 1): set text(fill: accent)
  show heading.where(level: 2): set text(fill: luma(20%))
  show heading.where(level: 3): set text(fill: accent.lighten(10%))

  set heading(numbering: "1.1)")
  // show heading.where(level: 1): it => context{
  //   if counter(heading).get() != (1, ) {pagebreak()}
  //   block(it)
  // }

  // show heading.where(level: 2): it => context{
  //   if counter(heading).get() != (1, 1) {line(length: 100%, stroke: .25pt)}
  //   v(.2em)
  //   // block(it)
  //   box(it)
  // }

  set footnote(numbering: "*")
  
  // show bibliography: set heading(numbering: "1)")
  // show bibliography: set par(justify: false)
  
  show table: set par(justify: false) 
  show table: set align(left)
  show table.cell.where(y: 0): set text(white, weight: "bold")
  show table.cell.where(y: 0): it => math.bold(it)
  // show table.cell.where(y: 1): set table.cell(fill: blue)
  set table(
    fill: (x,y) =>
      if y == 0 {accent},
    // stroke: frame(none),
    // stroke: (x,y) => (
    //   left: if x == 1 {gray}
    //   )
  )
  show table.cell.where(x: 0): set align(center)    

  // set math.equation(numbering: "(1)")
  show rect: set align(center)
  set par(justify: true)

  set enum(indent: .5em)
  set list(indent: 1em)

  set raw(lang: "MATLAB")
  // Display inline code 
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  
  // Display block code
  show raw.where(block: true): block.with(
    fill: luma(96%),
    inset: 10pt,
    radius: 4pt,
  )

  set page(
    paper: "us-letter", 
    numbering: "1", 
    number-align: right, 
    margin: (
      rest: .75in,
      // bottom: .875in,
      // rest: .625in
    ), 
    height: page-height, 
    width: page-width, 
    footer-descent: 40%,
    footer: context {
      if counter(page).get() > (1, ) {
        set text(8pt, weight: 300)
        h(1fr)
        [#for a in authors [#a.name#if a != authors.last() [, ]] - ]
        text(fill: accent, weight: "bold", counter(page).display("1"))
      }
    },
    header: context {
        set text(8pt, weight: 300)
        if counter(page).get() > (1, ) {
        smallcaps[ #class #h(1fr) #text(fill: accent, weight: "bold")[#title]]
      }
    }
  )

  let cover-page = bytes(read("Report Cover.svg")
    .replace(
      black.to-hex(), 
      accent.lighten(10%).to-hex())
    )

  let descriptor(body) = text(
    luma(20%),
    0.9em,
    weight: 300,
    body
  )

  page(
    height: 11in,
    background: image(cover-page, width: 100%),
    margin: (rest: .75in, bottom: .6in),
    {
    set text(1.1em)
    align(
    stack(
      spacing: 0.8em, 
      text(weight: 700, 2.5em, fill: accent, title),
      v(1.7em),
      text(weight: 300, 1.5em, class),
      v(1em),
      text(weight: 300, 1em, datetime.today().display("[month repr:long] [day], [year]")),
      
      line(length: 67%, stroke: .5pt),
      v(4pt),
      line(length: 65%, stroke: .5pt ),
      v(1em),
      
      descriptor[Team Number: ] + team-number,
      descriptor[Project Name: ] + project-name,
      descriptor[Professor Contact: ] + professor-contact,
      descriptor[TA Contact: ] + ta-contact,
      v(1fr),
      v(4em),
      {
        set text(1.4em, white, weight: "bold")
        grid(
          columns: 2,
          row-gutter: 6pt,
          column-gutter: .7em, 
          ..authors.map(a => (
            a.name, 
            text(.8em, weight: 400)[(#a.id)],
          )).flatten()
        )
      },
      v(1.3em),
      )
    )
  }
  )
  pagebreak()

  // Main body.
  body
}

// Display Functions
#let fig(path, cap: none, width: auto) = figure(image(path, width: width), caption: cap)

#let equation-counter = counter("equations")
#let equ(number) = [Equation #numbering("⓵", number)]

#let num = context{
  equation-counter.step()
  let disp = numbering("⓵", ..equation-counter.get().flatten()) 
  $space disp$
}

#let problem-num = counter("prob")
#let prob(content, page-break: false) = context {
  problem-num.step()
  equation-counter.update(1)
  {
    if problem-num.get().first() >= 1 and page-break {pagebreak()}

    if content != [] {
    heading(level: 1, [
      Problem #context problem-num.display() - #content
    ])
  } else {
    heading(level: 1, [
      Problem #context problem-num.display()
    ])
    }
  }
}

#let known(..array) = {
  figure(table(
    columns: 3,
    [Var], [Val], [Description],
    ..array
  ))
}

/////////////////////////////////////////////////
//        Shorthands & Custom Functions        //
/////////////////////////////////////////////////

#let pyth(var1, var2) = $sqrt((var1)^2 + (var2)^2)$
#let unitcalc(var1, var2, var3) = $frac((var1)ii + (var2)jj + (var3)kk, sqrt((var1)^2 + (var2)^2 + (var3)^2))$
#let vecdisp(var1, var2, var3) = $(var1) ii + (var2) jj + (var3) kk$
#let det(v1, v2, v3, v4 ,v5, v6) = $mat(ii, jj, kk; v1, v2, v3; v4, v5, v6; delim: "[")$
#let mac(content, power) = $lr(angle.l content angle.r) ^ power$

#let ans(content, alignment: center) = align(alignment)[#block(fill: rgb(255,252,0,255), radius: 4pt, inset: 3pt, content)]
#let ans(equation) = block(fill: rgb("#fffda0"), radius: 4pt, inset: .5em, {$ equation $})
// #let ans(content, alignment: center) = align(alignment)[#block(stoke: 1pt, radius: 2pt, inset: 3pt, content)]
// #let ans(equation) = block(stroke: .5pt, radius: 2pt, inset: .4em, {$ equation $})

#let pow(value) = [#math.times 10#super[#value]]
#let powMod(input, order) = {
let modded = calc.round(input*calc.pow(10, order), digits: 2)
$modded ee(- order)$
}


// Rounding
#let r0(num) = calc.round(num, digits: 0)
#let r1(num) = calc.round(num, digits: 1)
#let r2(num) = calc.round(num, digits: 2)
#let r3(num) = calc.round(num, digits: 3)
#let r6(num) = calc.round(num, digits: 6)


// Shorthand
#let then = $quad arrow.double quad$
#let imp = $&=>$
#let there = $therefore quad $
#let also = $quad \& quad$
#let e(var) = $times 10^(var)$
#let ee(var) = $times 10^(var)$
#let eet(var) = [#math.times\10#super[#var]]
#let tot = "tot"
#let shear = $tau_(x y)$
#let shearp = $tau_(x' y')$
#let avg = "avg"
#let PE = "PE"
#let KE = "KE"
#let ref = "ref"
#let cq = $, quad$

// Chem
#let CO2 = $"CO"_2$
#let CO = $"CO"$
#let SO2 = $"SO"_2$
#let O2 = $"O"_2$
#let OH = "OH"
#let N2 = $"N"_2$
#let H2 = $"H"_2$
#let CH4 = $"CH"_4$
#let H2O = $"H"_2"O"$
#let H20 = $"H"_2"O"$
#let N2 = $"N"_2$
#let C3H8 = $"C"_3"H"_8$
#let C5H12 = $"C"_5"H"_12$
#let C2H5OH = $"C"_2"H"_5"OH"$
#let lbmol = "lbmol"

#let hb = $macron(h)$
#let dhb = $Delta macron(h)$
#let hbf = $macron(h)_f^degree$
#let nf = $dot(n)$
#let nff = $dot(n)_"fuel"$
#let qd = $dot(Q)$
#let sb = $macron(s)$
#let sbf = $macron(s) ^degree$ 
#let da  = sym.harpoons.rtlb
#let gib = $Delta G ^ degree$
#let gibb = $macron(g) ^ degree$


// Units
#let MPA = "MPa"
#let MPa = "MPa"
#let kip = "kip"
#let ksi = "ksi"
#let in2 = "in²"
#let um = "μm"
#let GPa = "GPa"
#let milli = $ee(-3)$
#let micro = $space"μ"$
// #let micro = $ee(-6)$
#let nano = $ee(-9)$
#let kN = "kN"
#let MN = $ee(6) "N "$
#let ft = "ft"
#let Nm = "N⋅m"
#let lbf = "lbf"
#let lbfts = "lb⋅ft/s²"
#let kNm = "kN⋅m"
#let fts = "ft/s²"
#let lb = "lb"
#let npm = "N/m²"
#let kg = "kg"
#let kgs = "kg/s"
#let kgs2 = "kg/s²"
#let kgm2 = "kg" + sym.dot + "m²"
#let m2 = "m²"
#let m4 = "m⁴"
#let new = "N "
#let met = "m "
#let hr = "hr"
#let sec = "sec"
#let ms2 = "m/s²"
#let m3 = "m³"
#let kJ = "kJ"
#let bar = "bar"
#let kW = "kW"
#let degC = "°C"
#let degK= "K"
#let degF= "°F"
#let degR= "°R"
#let net = "net"
#let volt = "V "
#let out = "out"
#let inn = "in"
#let amp = "A "
#let lbfin2 = "lb/in²"
#let ft3lb = "ft³/lb"
#let btulb = "Btu/lb"
#let btulbmol = "Btu/lbmol"
#let btulbR = "Btu/lb⋅R"
#let m3kg = "m³/kg"
#let kjkg = "kJ/kg"
#let kPa = "kPa"
#let kjkmol = "kJ/kmol"
#let kjkmolK = "kJ/kmol⋅K"
#let kjkgK = "kJ/kg⋅K"
#let mf = $dot(m)$
#let lbs = "lb/s"
#let vel = $arrow(v)$
#let ms = "m/s"
#let sun = "kJ/kg⋅K"


// Notation
#let dp = $d p$
#let phi = math.phi.alt
#let yy = $macron(y)$
// #let ii = $hat(i)$
// #let jj = $hat(j)$
// #let kk = $hat(k)$
// #let rr = $hat(r)$
// #let RR = $arrow(R)$
// #let FF = $arrow(F)$
// #let ll(var) = $arrow(lambda)_(var)$
// #let xp = $attach(->, tr: plus.circle)$
// #let yp = $attach(arrow.t, tr: plus.circle)$
// #let rp = $attach(arrow.ccw, tr: plus.circle)$
// #let NV(var) = $arrow(N)_(var)$
// #let NCA = $arrow(N)_(C A)$
// #let NCB = $arrow(N)_(C B)$
// #let (ax, ay, bx, by, cx, cy, dx, dy) = ($F_A_x$, $F_A_y$, $F_B_x$, $F_B_y$, $F_C_x$, $F_C_y$, $F_D_x$, $F_D_y$)
#let (sfx, sfy) = ($Sigma F_x &= 0 $, $Sigma F_y &= 0 $)
#let (sma, smb, smc, smd, sms) = ($Sigma M_A &= 0 $, $Sigma M_B &= 0 $, $Sigma M_C &= 0 $, $Sigma M_D &= 0 $, $Sigma M_"sec" &= 0  $)