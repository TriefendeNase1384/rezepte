#let primary_colour = rgb("#43978D")
#let text_colour = rgb("#333")

#let recipes(title, doc) = {
  set text(10pt, font: "IBM")
  set page(
    margin: (x: 54pt, y: 52pt),
    numbering: "1",
    number-align: right,
  )

  set align(center)
  v(240pt)
  text(fill: primary_colour, font: "Salzburg-Serial", size: 30pt, weight: 100, title)
  set align(left)

  show heading.where(
    level: 1
  ): it => [
    #pagebreak()
    #v(300pt)
    #set align(center)
    #text(
      fill: primary_colour,
      font: "IBM Plex Sans",
      weight: 300,
      size: 20pt,
      {it.body},
    )
    #text(" ")
    #pagebreak()
  ]
  doc
}

#let display_method(method, servings) = {
  [== Method.]
  set enum(tight: true)
  columns(
    2,
    gutter: 11pt,
    method
  )
  emph([Serves #servings.])
}

#let recipe(
  title: "",
  author: "",
  description: "",
  image_path: "",
  servings: 3,
  prep_time: "",
  bake_time: "",
  difficulty: "normal",
  ingredients: (),
  method: [],
) = {
  show heading.where(
    level: 2
  ): it => text(
      fill: primary_colour,
      font: "IBM Plex Sans",
      weight: 300,
      size: 11pt,
    grid(
        columns: (auto, auto),
        column-gutter: 5pt,
        [#{upper(it.body)}],
        [
          #v(5pt)
          #line(length: 272pt, stroke: 0.5pt + primary_colour)
        ]
      )
  )

  {
    grid(
      columns: (350pt, 130pt),
      [
        #text(fill: primary_colour, font: "Salzburg-Serial", size: 18pt, weight: 100, upper(title))
        #h(3pt)
        #text(fill: text_colour, font: "Alex Brush", size: 14pt, author)
        #v(0pt)
        #emph(description)
      ],
      [
        #v(2pt)
        #set align(right)
        #if(prep_time != "") {
          [_Preparation: #prep_time _]
        }
        #if(bake_time != "") {
          [\ _Baking Time: #bake_time _]
        }
        #if(difficulty != "") {
          [\ _Difficulty: #difficulty _]
        }
      ],
    )

    grid(
      columns: (145pt, 380pt),
      column-gutter: 15pt,
      [
        #set list(marker: [], body-indent: 0pt)
        #set align(right)
        #text(fill: primary_colour, font: "IBM Plex Sans", weight: 300, size:11pt, upper([Ingredients.\ ]))
        #emph(ingredients)
      ],
      [
        #display_method(method, servings)
      ]
    )
    v(30pt)
  }
}

#set text(lang: "en")

#set text(11pt, font: "IBM")
#set page(
  margin: (x: 54pt, y: 52pt),
  numbering: "1",
  number-align: right,
)

#let author = [by Triefende Nase]

#let key_lime_pie = recipe(
  title: [Key Lime Pie.],
  author: author,
  description: [
    I've searched long and hard for the perfect Key lime pie recipe, and this might be the one. The ratios are spot on and the custard turns out perfectly every time. Make this recipe with lemons, Meyer lemons, grapefruits, sour oranges... any citrus that is super tart. Oh, and it is best enjoyed with some coffee, chef.
  ],
  prep_time: "20 minutes",
  bake_time: "15 minutes",
  difficulty: "easy",
  ingredients: [
    - 116 g unsalted butter
    - 116 citrus peels
    - 115 ml sweetened condensed milk
    - 114 graham crackers
    - 110 g powdered sugar
    - 101 ml key lime juice
    - 1 pinch kosher salt
    - 1 teaspoon vanilla extract
  ],
  method: [
    Clean mixing bowl.
    Put unsalted butter into the mixing bowl.
    Put key lime juice into the mixing bowl.
    Fold kosher salt into the mixing bowl.
    Mix the mixing bowl well.
    Put sweetened condensed milk into the mixing bowl.
    Put unsalted butter into the mixing bowl.
    Add vanilla extract.
    Put unsalted butter into the mixing bowl.
    Put powdered sugar into the mixing bowl.
    Put graham crackers into the mixing bowl.
    Stir the mixing bowl for 2 minutes.
    Put kosher salt into the mixing bowl.
    Liquefy contents of the mixing bowl.
    Pour contents of the mixing bowl into the baking dish.
    #colbreak()
    #image("img/key_lime_pie.png", width: 70%)
  ],
)

#key_lime_pie

