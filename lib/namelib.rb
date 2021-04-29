require 'byebug'
module Namelib
  VERSION = '2.1.0'

  POST_NOMINAL_INITIALS = %w(
    VC GC KG LG KT LT KP GCB OM GCSI GCMG GCIE GCVO GBE CH KCB DCB KCSI KCMG
    DCMG KCIE KCVO DCVO KBE DBE CB CSI CMG CIE CVO CBE DSO LVO OBE ISO MVO MBE
    IOM CGC RRC DSC MC DFC AFC ARRC OBI DCM CGM GM IDSM DSM MM DFM AFM SGM IOM
    CPM QGM RVM BEM QPM QFSM QAM CPM MSM ERD VD TD UD ED RD VRD AE

    PC ADC QHP QHS QHDS QHNS QHC SCJ J LJ QS SL QC KC JP DL MP MSP MSYP AM AM
    MLA MEP  DBEnv DConstMgt DREst EdD DPhil PhD DLitt DSocSci MD EngD DD LLD
    DProf MA MArch MAnth MSc MMORSE MMath MMathStat MPharm MPhil MSc MSci MSt
    MRes MEng MChem MBiochem MSocSc MMus LLM BCL MPhys MComp MAcc MFin MBA MPA
    MEd MEP MEnt MCGI MGeol MLitt MEarthSc MClinRes BA BSc LLB BEng MBChB FdA
    FdSc FdEng PgDip PgD PgCert PgC PgCLTHE AUH AKC AUS HNC HNCert HND HNDip
    DipHE Dip OND CertHE ACSM MCSM DIC AICSM ARSM ARCS LLB LLM BCL MJur DPhil
    PhD LLD DipLP FCILEx GCILEx ACILEx CQSW DipSW BSW MSW FCILT CMILT MILT CPL
    CTP CML PLS CTL DLP PLog EJLog ESLog EMLog JrLog Log SrLog BArch MArch ARB
    RIBA RIAS RIAI RSAW MB BM BS BCh BChir MRCS FRCS MS MCh. MRCP FRCP MRCPCH
    FRCPCH MRCPath MFPM FFPM BDS MRCPsych FRCPsych MRCOG FRCOG MCEM FCEM FRCA
    FFPMRCA MRCGP FRCGP BSc MScChiro MChiro MSc DC LFHOM MFHOM FFHOM FADO FBDO
    FCOptom MCOptom MOst DPT MCSP FCSP. SROT MSCR FSCR. CPhT RN VN RVN BVSc
    BVetMed VetMB BVM&S MRCVS FRCVS FAWM PGCAP PGCHE PGCE PGDE BEd NPQH QTS
    CSci CSciTeach RSci RSciTech CEng IEng EngTech ICTTech DEM MM CMarEng
    CMarSci CMarTech IMarEng MarEngTech RGN SRN RMN RSCN SEN EN RNMH RN RM RN1
    RNA RN2 RN3 RNMH RN4 RN5 RNLD RN6 RN8 RNC RN7 RN9 RHV RSN ROH RFHN SPAN
    SPMH SPCN SPLD SPHP SCHM SCLD SPCC SPDN V100 V200 V300 LPE MSc
  )

  # Returns a new +String+ with the contents properly namecased
  def nc(options = {})
    Namelib.nc self, options
  end

  # Modifies _str_ in place and properly namecases the string.
  def nc!(options = {})
    Namelib.nc! self, options
  end

  def self.nc! str, options = {}
    str.replace Namelib.nc(str, options)
  end

  def self.nc str, options = {}
    options = { :lazy => true, :irish => true, :spanish => true, :post_nominal_initials => true }.merge options

    # Skip if string is mixed case
    if options[:lazy]
      first_letter_lower = str[0] == str.downcase[0]
      all_lower_or_upper = (str.downcase == str || str.upcase == str)

      return str unless first_letter_lower || all_lower_or_upper
    end

    localstring = str.downcase
    localstring.gsub!(/\b\w/) { |first| first.upcase }
    localstring.gsub!(/\'\w\b/) { |c| c.downcase } # Lowercase 's

    if options[:irish]
      if localstring =~ /\bMac[A-Za-z]{2,}[^aciozj]\b/ or localstring =~ /\bMc/
        match = localstring.match(/\b(Ma?c)([A-Za-z]+)/)
        localstring.gsub!(/\bMa?c[A-Za-z]+/) { match[1] + match[2].capitalize }

        # Now fix "Mac" exceptions
        localstring.gsub!(/\bMacEdo/, 'Macedo')
        localstring.gsub!(/\bMacEvicius/, 'Macevicius')
        localstring.gsub!(/\bMacHado/, 'Machado')
        localstring.gsub!(/\bMacHar/, 'Machar')
        localstring.gsub!(/\bMacHin/, 'Machin')
        localstring.gsub!(/\bMacHlin/, 'Machlin')
        localstring.gsub!(/\bMacIas/, 'Macias')
        localstring.gsub!(/\bMacIulis/, 'Maciulis')
        localstring.gsub!(/\bMacKie/, 'Mackie')
        localstring.gsub!(/\bMacKle/, 'Mackle')
        localstring.gsub!(/\bMacKlin/, 'Macklin')
        localstring.gsub!(/\bMacKmin/, 'Mackmin')
        localstring.gsub!(/\bMacQuarie/, 'Macquarie')
      end
      localstring.gsub!('Macmurdo','MacMurdo')
    end

    # Fixes for "son (daughter) of" etc
    localstring.gsub!(/\bAl\b(?=.+\w)/, 'al')  # al Arabic, but NOT the first name Al.
    localstring.gsub!(/\b(Bin|Binti|Binte)\b/,'bin')  # bin, binti, binte Arabic
    localstring.gsub!(/\bAp\b/, 'ap')         # ap Welsh.
    localstring.gsub!(/\bBen(?=\s+\w)/,'ben') # ben Hebrew, but NOT the first name Ben.
    localstring.gsub!(/\bDell([ae])\b/,'dell\1')  # della and delle Italian.
    localstring.gsub!(/\bD([aeiou'’])\b/,'d\1')   # da, de, di Italian; du, d' French; do Brasil
    localstring.gsub!(/\bD([ao]s)\b/,'d\1')   # das, dos Brasileiros
    localstring.gsub!(/\bDe([lr])\b/,'de\1')   # del Italian; der Dutch/Flemish.
    localstring.gsub!(/\bEl\b/,'el')   # el Greek or El Spanish.
    localstring.gsub!(/\bLa\b/,'la')   # la French or La Spanish.
    localstring.gsub!(/\bL([eo'’])\b/,'l\1')      # lo Italian; le, l' French.
    localstring.gsub!(/\bVan(?=\s+\w)/,'van')  # van Dutch/Flemish, but NOT the first name Van.
    localstring.gsub!(/\bVon\b/,'von')  # von German

    # Fix roman numeral names
    localstring.gsub!(
      / \b ( (?: [Xx]{1,3} | [Xx][Ll]   | [Ll][Xx]{0,3} )?
      (?: [Ii]{1,3} | [Ii][VvXx] | [Vv][Ii]{0,3} )? ) \b (?= \s | \z ) /x
    ) { |m| m.upcase }

    if options[:spanish]
      ["Y", "E", "I"].each do |conjunction|
        localstring.gsub!(/\b#{conjunction}\b/, conjunction.downcase)
      end
    end

    if options[:post_nominal_initials]
      POST_NOMINAL_INITIALS.each do |pni|
        localstring.gsub!(/(\b)(#{pni})(.?\s*)$/i, '\1' + pni + '\3')
      end
    end

    localstring
  end
end

def Namelib(string, options = {})
  Namelib.nc string, options
end

def Namelib!(string, options = {})
  Namelib.nc! string, options
end
