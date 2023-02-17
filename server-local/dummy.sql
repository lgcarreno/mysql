INSERT INTO site (code, name)
VALUES
    ('MLA', 'MLA'),
    ('MCO', 'MCO'),
    ('MLB', 'MLB');

INSERT INTO domain (code, name)
VALUES
    ('PERFUMES', 'PERFUMES'),
    ('JACKETS_AND_COATS', 'JACKETS_AND_COATS'),
    ('GAME_CONSOLES_VIDEO_GAMES_AND_ARCADE_MACHINES', 'GAME_CONSOLES_VIDEO_GAMES_AND_ARCADE_MACHINES'),
    ('CELLPHONE_USB_AND_AUXILIARY_ADAPTERS', 'CELLPHONE_USB_AND_AUXILIARY_ADAPTERS'),
    ('TABLET_CASES', 'TABLET_CASES');

INSERT INTO brand (code, name)
VALUES
    ('accesorios_apple', 'accesorios_apple'),
    ('samsung', 'samsung'),
    ('carolina_herrera', 'carolina_herrera'),
    ('louis_vuitton', 'louis_vuitton'),
    ('new_balance', 'new_balance');

INSERT INTO model (code, name)
VALUES
    ('GDLS', 'GDLS'),
    ('GDLSR', 'GDLSR'),
    ('PATCHFINDER', 'PATCHFINDER');

INSERT INTO dataset_field (code, name)
VALUES
    ('ITE_BASE_CURRENT_PRICE', 'ITE_BASE_CURRENT_PRICE'),
    ('BRAND', 'BRAND'),
    ('ITE_ITEM_TITLE', 'ITE_ITEM_TITLE'),
    ('BRAND_ATTRIBUTE', 'BRAND_ATTRIBUTE');

INSERT INTO user (username, password)
VALUES
    ('dev', '12345'),
    ('test', '12345'),
    ('prod', '12345');

SELECT @model_id := id FROM model WHERE code='GDLS';

INSERT INTO gdlsr.group (code, name, model_id)
VALUES
    ('GDLS_TABLET_CASES_COMPATIBLE', 'GDLS_TABLET_CASES_COMPATIBLE', @model_id);

SELECT @get_group_id := id FROM gdlsr.group WHERE code='GDLS_TABLET_CASES_COMPATIBLE';
SELECT @get_site_id := id FROM gdlsr.site WHERE code='MLA';

INSERT INTO gdlsr.group_has_site (group_id, site_id)
VALUES
    (@get_group_id, @get_site_id);

SELECT @get_domain_id := id FROM gdlsr.domain WHERE code='TABLET_CASES';

INSERT INTO gdlsr.group_has_domain (group_id, domain_id)
VALUES
    (@get_group_id, @get_domain_id);

SELECT @get_brand_id := id FROM gdlsr.brand WHERE code='samsung';

INSERT INTO gdlsr.group_has_brand (group_id, brand_id)
VALUES
    (@get_group_id, @get_brand_id);

SELECT @get_user_id := id FROM gdlsr.user WHERE username='dev';

INSERT INTO gdlsr.rule (code, expression, type, level, true_value, false_value, user_last_update, add_column, group_id, user_id)
VALUES
    ('GDLS_TABLET_CASES_COMPATIBLE', '(para|p\/|compat[íi1]vel|compatible|for).{0,10}', 'HARD_RULE', 'PRIMARY', '1', '-1', @get_user_id, '{"brand": "apple"}', @get_group_id, @get_user_id);

SELECT @get_rule_id := id FROM gdlsr.rule WHERE code='GDLS_TABLET_CASES_COMPATIBLE';
SELECT @get_dataset_field_id := id FROM gdlsr.dataset_field WHERE code='ITE_ITEM_TITLE'; 

INSERT INTO gdlsr.rule_has_dataset_field (rule_id, dataset_field_id)
VALUES
    (@get_rule_id, @get_dataset_field_id);
