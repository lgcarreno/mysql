rules_df = DataFrame({'TIPO':['HARD_RULE','HARD_RULE','HARD_RULE','HARD_RULE','REGEX'],
 'GRUPO':['GDLS_TABLET_CASES_PRECIO_1',
          'GDLS_TABLET_CASES_PRECIO_1',
          'GDLS_TABLET_CASES_PRECIO_2',
          'GDLS_TABLET_CASES_PRECIO_2',
          'GDLS_TABLET_CASES_COMPATIBLE'
         ],
 'NOMBRE': ['GDLS_TABLET_CASES_PRECIO_1_1',
            'GDLS_TABLET_CASES_PRECIO_1_2',
            'GDLS_TABLET_CASES_PRECIO_2_1',
            'GDLS_TABLET_CASES_PRECIO_2_2',
            'GDLS_TABLET_CASES_COMPATIBLE'
            ],
 'NIVEL': ['PRINCIPAL','PRINCIPAL','PRINCIPAL',
           'PRINCIPAL','PRINCIPAL'],
 'VALOR_VERDADERO': [1, 0, 1, 0, 0],
 'VALOR_FALSO': [-1, -1, -1, -1, -1],
 'REGLA': ["< 50", #50 apple oficial
        '>= 50',
        '< 15', #17 webpage liverpol
        '>= 15',
        '(para|p\/|compat[íi1]vel|compatible|for).{0,10}',
          ],
 'COLUMNA':[['ITE_BASE_CURRENT_PRICE'],
            ['ITE_BASE_CURRENT_PRICE'],
            ['ITE_BASE_CURRENT_PRICE'],
            ['ITE_BASE_CURRENT_PRICE'],
            ['ITE_ITEM_TITLE']
            ],
 'SIT_SITE_ID':["MLB, MLM, MLA, MLC, MCO, MPE, MLU, MEC" for i in range(5)],
 'ITE_DOM_DOMAIN_ID': ['TABLET_CASES', 'TABLET_CASES', 'TABLET_CASES', 'TABLET_CASES', 'TABLET_CASES'],
 "BRAND": ["apple","apple","samsung","samsung", ""]
        })