task :g do
  def modify(path, &block)
    warning = "--- DO NOT EDIT BELOW ---"
    header = File.read(path).lines.take_while { |line| line.chomp != warning }.join
    File.open(path, "wb") do |f|
      f << header
      f << warning + "\n"
      block.call(f)
    end
  end

  elements = %w(
    a abbr address article aside audio b bdi bdo blockquote br button canvas
    caption cite code col colgroup datalist dd del details dfn div dl dt em
    embed fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 header hr
    i iframe img input ins kbd label legend li main map mark math menu
    menuitem meter nav node object ol optgroup option output p param pre
    progress q rp rt ruby s samp section select small source span strong sub
    summary sup table tbody td textarea tfoot th thead time tr track u
    ul var video wbr
  ).sort

  modify("src/Hedwig/Element.purs") do |f|
    elements.each do |name|
      f << "
#{name} :: forall msg. Element msg
#{name} = element #{name.inspect}
"
    end
  end

  properties = ["classList", "style", "styles"]

  modify("src/Hedwig/Property.purs") do |f|
    %w(autocomplete autofocus autoplay checked contentEditable controls
    default disabled hidden isMap loop multiple noValidate readOnly required
    reversed selected spellcheck).sort.each do |name|
      properties << name
      f << "
#{name} :: forall msg. Boolean -> Trait msg
#{name} = property #{name.inspect}
"
    end

    %w(accept acceptCharset action align alt class':className coords dir
    download downloadAs dropzone enctype for:htmlFor headers href hreflang id
    kind lang max method min name pattern ping placeholder poster preload
    sandbox scope shape src srcdoc srclang step target title type':type
    useMap value wrap accessKey).sort.each do |name|
      name, string = name.include?(":") ? name.split(":") : [name, name]
      properties << name
      f << "
#{name} :: forall msg. String -> Trait msg
#{name} = property #{string.inspect}
"
    end

    %w(tabindex height width minlength maxlength size cols rows colspan rowspan
    start).sort.each do |name|
      properties << name
      f << "
#{name} :: forall msg. Int -> Trait msg
#{name} = attribute #{name.inspect} <<< show
"
    end

    %w(contextmenu draggable itemprop list media rel datetime pubdate manifest
    ).sort.each do |name|
      properties << name
      f << "
#{name} :: forall msg. String -> Trait msg
#{name} = attribute #{name.inspect}
"
    end
  end

  modify("src/Hedwig.purs") do |f|
    f << "\nimport Hedwig.Element (\n"
    f << elements.sort.map { |element| "  #{element}" }.join(",\n")
    f << "\n) as Exports\n"

    f << "\nimport Hedwig.Property (\n"
    f << properties.sort.map { |property| "  #{property}" }.join(",\n")
    f << "\n) as Exports\n"

    f << "
infixr 6 Tuple as :>

sync :: forall a. Effect a -> Aff a
sync = liftEffect
"
  end

  # SVG
  elements = %w(a animate animateColor animateMotion animateTransform circle
  clipPath color-profile cursor defs desc discard ellipse feBlend feColorMatrix
  feComponentTransfer feComposite feConvolveMatrix feDiffuseLighting
  feDisplacementMap feDistantLight feDropShadow feFlood feFuncA feFuncB feFuncG
  feFuncR feGaussianBlur feImage feMerge feMergeNode feMorphology feOffset
  fePointLight feSpecularLighting feSpotLight feTile feTurbulence filter font
  font-face font-face-format font-face-name font-face-src font-face-uri
  foreignObject g glyph glyphRef hatch hatchpath hkern image line linearGradient
  marker mask mesh meshgradient meshpatch meshrow metadata missing-glyph mpath
  path pattern polygon polyline radialGradient rect script set solidcolor stop
  style svg switch symbol text textPath title tref tspan unknown use view vkern)

  modify("src/Hedwig/Svg.purs") do |f|
    f << "\n-- Elements --\n"
    elements.each do |name|
      fname = name.gsub(/-(.)/) { |m| m[1].upcase }
      f << "
#{fname} :: forall msg. Element msg
#{fname} = element #{name.inspect}
"
    end
    f << "\n-- /Elements --\n\n"
    f << "-- Attributes --\n"
    %w(externalResourcesRequired preserveAlpha).each do |name|
      f << "
#{name} :: forall msg. Boolean -> Trait msg
#{name} = attribute #{name.inspect} <<< show
"
    end
    %w(numOctaves tabindex).each do |name|
      f << "
#{name} :: forall msg. Int -> Trait msg
#{name} = attribute #{name.inspect} <<< show
"
    end
    %w(accent-height ascent azimuth bias diffuseConstant divisor elevation fr k1
    k2 k3 k4 limitingConeAngle overline-position overline-thickness pathLength
    pointsAtX pointsAtY pointsAtZ refX refY scale seed specularConstant
    specularExponent strikethrough-position strikethrough-thickness
    stroke-miterlimit surfaceScale targetX targetY underline-position
    underline-thickness version).each do |name|
      fname = name.gsub(/-(.)/) { |m| m[1].upcase }
      if elements.include?(name) || elements.include?(fname)
        fname = fname + "Attr"
      end
      f << "
#{fname} :: forall msg. Number -> Trait msg
#{fname} = attribute #{name.inspect} <<< show
"
    end
    %w(cx cy fill-opacity fx fy height markerHeight markerWidth r
    stroke-dashoffset stroke-opacity stroke-width textLength width x x1 x2 y y1
    y2 accumulate additive alignment-baseline attributeName attributeType
    baseFrequency baseline-shift baseProfile begin calcMode class clipPathUnits
    clip-path clip-rule color color-interpolation color-interpolation-filters
    color-profile color-rendering contentScriptType contentStyleType cursor d
    direction display dominant-baseline dur dx dy edgeMode end fill fill-rule
    filter filterUnits flood-color flood-opacity font-family font-size
    font-size-adjust font-stretch font-style font-variant font-weight from
    gradientTransform gradientUnits href image-rendering in in2 kernelMatrix
    kernelUnitLength kerning keySplines keyTimes lengthAdjust letter-spacing
    lighting-color local marker-end marker-mid marker-start markerUnits mask
    maskContentUnits maskUnits max min mode opacity operator order overflow
    paint-order patternContentUnits patternTransform patternUnits pointer-events
    points preserveAspectRatio primitiveUnits radius repeatCount repeatDur
    requiredFeatures restart result rx ry shape-rendering stdDeviation
    stitchTiles stop-color stop-opacity stroke stroke-dasharray stroke-linecap
    stroke-linejoin style text-anchor text-decoration text-rendering to
    transform type values vector-effect viewBox visibility word-spacing
    writing-mode xChannelSelector yChannelSelector).each do |name|
      fname =
        case name
        when "class", "in", "type" then name + "'"
        else name.gsub(/-(.)/) { |m| m[1].upcase }
        end
      if elements.include?(name) || elements.include?(fname)
        fname = fname + "Attr"
      end
      f << "
#{fname} :: forall msg. String -> Trait msg
#{fname} = attribute #{name.inspect}
"
    end
    f << "\n-- /Attributes --\n"
  end
end

task "gh-pages" do
  sh <<-SH
cd examples && \
rake && \
cd dist dist && \
git init && \
git add . && \
git commit -m init && \
git remote add origin git@github.com:utkarshkukreti/purescript-hedwig.git && \
git push origin master:gh-pages -f
SH
end
