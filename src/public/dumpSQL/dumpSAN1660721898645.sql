/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: balizamiento
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `balizamiento` (
  `nif` varchar(8) NOT NULL,
  `num_internacional` varchar(12) DEFAULT NULL,
  `tipo` varchar(250) DEFAULT NULL,
  `telecontrol` varchar(200) DEFAULT NULL,
  `apariencia` varchar(50) DEFAULT NULL,
  `periodo` decimal(5, 2) DEFAULT NULL,
  `caracteristica` varchar(50) NOT NULL,
  PRIMARY KEY (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de balizas';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cochecito
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cochecito` (
  `usuario` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `horaE` varchar(5) DEFAULT NULL,
  `horaS` varchar(5) DEFAULT NULL,
  `motivo` varchar(100) NOT NULL,
  PRIMARY KEY (`usuario`, `fecha`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de uso del vehiculo';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: documentos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `documentos` (
  `id_archivo` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de documentos';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: eliminados
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `eliminados` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(10) NOT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'Tabla de elementos de inventario eliminados';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: inventario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `inventario` (
  `id` mediumint(9) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de inventario';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lampara
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lampara` (
  `nif` varchar(8) NOT NULL,
  `altura` int(11) DEFAULT NULL,
  `elevacion` int(11) DEFAULT NULL,
  `alcanceNom` float(10, 2) DEFAULT NULL,
  `linterna` varchar(200) DEFAULT NULL,
  `candelasCalc` float(12, 2) DEFAULT NULL,
  `alcanceLum` float(10, 2) DEFAULT NULL,
  `candelasInst` float(12, 2) DEFAULT NULL,
  PRIMARY KEY (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de detalles lampara';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: localizacion
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `localizacion` (
  `nif` varchar(8) NOT NULL,
  `puerto` varchar(50) DEFAULT NULL,
  `num_local` decimal(5, 0) DEFAULT NULL,
  `localizacion` varchar(70) DEFAULT NULL,
  `latitud` varchar(15) DEFAULT NULL,
  `longitud` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de localizacion del balizamiento';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: logs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `logs` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(10) NOT NULL,
  `accion` varchar(20) DEFAULT NULL,
  `observacion` varchar(150) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de logs';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mantenimiento
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mantenimiento` (
  `id_mantenimiento` int(10) unsigned NOT NULL,
  `nif` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `mantenimiento` varchar(250) NOT NULL,
  PRIMARY KEY (`id_mantenimiento`),
  KEY `mantenimiento_FK` (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de mantenimiento del balizamiento';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: observaciones
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `observaciones` (
  `id_observacion` int(10) unsigned NOT NULL,
  `nif` varchar(8) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  PRIMARY KEY (`id_observacion`),
  KEY `observaciones_FK` (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'tabla de observaciones del balizamiento';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf16 COLLATE = utf16_spanish2_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: usuarios
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `privilegio` varchar(20) DEFAULT NULL,
  `pictureURL` varchar(100) CHARACTER SET utf16 COLLATE utf16_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = latin1 COMMENT = 'tabla de usuarios';

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: balizamiento
# ------------------------------------------------------------

INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25460',
    'E-0190',
    'Baliza Torre troncopiramidal verde blanca',
    '',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25470',
    'E-0190.2',
    'Baliza Torre troncopiramidal roja blanca',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25530',
    'E-0194',
    'Baliza Torre de hormigón triangular verde',
    'Sí  RTU Nº 41',
    'DV  5s',
    5.00,
    'L1 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25545',
    'E-0193',
    'Baliza Torre de hormigón triangular ',
    'RTU Nº 42',
    'DR 5s.',
    5.00,
    'L1 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25552',
    'E-0196',
    'Baliza Torre cilíndrica y base troncopiramidal',
    '',
    'Gp D (2) R   7s.',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25554',
    '',
    'Boya de espeque roja/verde MSM',
    'NO',
    '',
    14.50,
    'L0,5 oc1 L0,5 oc3 L0,5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25555',
    'E-0196.2',
    'Baliza Columna cuadrangular verde',
    '',
    'Gp D(2) V  7s.',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25560',
    'E-0196.25',
    'Baliza Columna cuadrangular',
    'NO',
    'Gp D(4)R  11s.',
    11.00,
    '(L0,5 oc1,5)3 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25563',
    'E-0196.32',
    'Baliza Linterna sobre pilote. ',
    'NO',
    'Gp D (4 )  V  11s.',
    11.00,
    '(L0,5 oc1,5)3 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25564',
    '',
    'Baliza Linterna sobre pilote. ',
    'SI',
    'D Amarillos 3s.',
    3.00,
    ' L0,5 oc 2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25565',
    'E-0196.3',
    'Baliza Torre troncopiramidal verde',
    '',
    'D Verdes. 3s',
    3.00,
    ' L0,5 oc 2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25570',
    'E-0196.35',
    'Baliza Torre tronco piramidal roja',
    '',
    'Gp D(3) R  9s.',
    9.00,
    '(L0,5 oc1,5)2 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25590',
    'E-0197',
    'Baliza Torre cilíndrica verde sobre base verde',
    '',
    'GpD(4)V',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25600',
    'E-0197.2',
    'Baliza Torre cilíndrica rojae sobre base roja',
    '',
    'GpD(4)R',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25620',
    'E-0197.5',
    'Baliza Panel circular blanco, bandas rojas en el tablero del puente',
    '',
    'Iso B',
    2.00,
    'L2 oc'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25640',
    '',
    'Baliza Columna de hierro',
    '',
    'sin apariencia ',
    0.00,
    'sin periodo'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25650',
    'E-0198',
    'Faro',
    'Si SCADA',
    'GpD(3)',
    20.00,
    'L 0.255 Oc 3.745 L 0.255 Oc 3.745 L 0.255 Oc 11.74'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25660',
    'E-0199',
    'Baliza Torreta cuadrangular verde.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25665',
    'E-0199.2',
    'Baliza Espeque rojo con la base blanca.',
    '',
    'GpD(3)R',
    1.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc6,'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25667',
    'E-0199.6',
    'Baliza Poste cuadrangular rojo.',
    '',
    'GpD(4)R',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc5,'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25700',
    'FValencia',
    'Faro',
    'Si SCADA',
    'D',
    10.00,
    'L 0,8 OC 9,8'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25720',
    'E-0200.4',
    'Baliza Cilíndrica verde base blanca',
    'RTU 06',
    'DV',
    5.00,
    'L1 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25721',
    'E-0200.5',
    'Baliza TPS 3.3',
    '',
    'D V',
    5.00,
    'L1 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25730',
    '',
    'Boya Castillete negra amarilla negra y marca de tope',
    'No lo necesita',
    'GRp(3)B',
    5.00,
    '[(L 0.25 oc 0.25)x2] + L 0.25 oc 3.75'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25740',
    '654',
    'Boya Castillete roja y marca de tope',
    'No lo necesita',
    'D R',
    4.00,
    'L0.5 oc3.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25761',
    '',
    'Boya Castillete amarilla y marca de tope',
    'RTU 04',
    'GpD (4) A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25765',
    '',
    'Boya Castillete amarilla y marca de tope',
    'RTU 02',
    'GpD (4) A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25768',
    '',
    'Boya Castillete verde-roja-verde y marca de tope',
    'No',
    'GpD(2+1) V',
    14.50,
    'L0.5 oc1 L0.5 oc3 L0.5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25774',
    'E-0201.11',
    'Baliza Cilíndrica roja, base blanca',
    'RTU 10',
    'GpD (2)R',
    7.00,
    'L0.5 oc 1.5 L0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25776',
    'E-0201.25',
    'Baliza TPS 3.3',
    '',
    'GpD(3)R',
    9.00,
    '[(L0.5 oc1.5)x2]+L0.5 oc 4.'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25777',
    'E-0201.16',
    'Baliza TPS 3.3',
    '',
    'GpD(3)R',
    9.00,
    '[(L 0.5 oc 1.5)x2] L0.5 oc 4.'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25800',
    'E-0201.2',
    'Baliza TPS 3.3',
    '',
    'DR',
    3.00,
    'L 0.5 oc 2.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25820',
    'E-0201.4',
    'Baliza TPS 3.3',
    '',
    'GpD(2)V   ',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25820.1',
    '',
    'Boya Castillete verde-roja-verde y marca de tope',
    'Sí',
    'GpD (2)V',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25830',
    'E-0201.5',
    'Baliza TPS 4.8',
    '',
    'GpD(2)V',
    9.00,
    '[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25831',
    '',
    'Baliza Columna cilíndrica verde con la base blanca.',
    '',
    'GpD (3)V',
    9.00,
    'L 0,5 + oc 1,5 + L 0,5 + oc 1,5 + L 0,5 + oc 4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25840',
    'E-0202',
    'Baliza TPS 3.3',
    'RTU 44',
    'GpD (4)R',
    11.00,
    '[(0.5 oc 1.5)x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25841',
    '',
    'Boya Castillete rojo y marca de tope',
    'RTU 54',
    'GpD (4)R',
    11.00,
    '[( L 0.5 oc 1.5)x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25842',
    'E-0201.7',
    'Baliza TPS 3.3',
    '',
    'GpDV',
    3.00,
    'L 0.5 oc 2.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25842.5',
    '',
    'Boya Cilíndrica verde.',
    'Si.',
    'Ct',
    1.00,
    'L 0,5 + oc 0,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25843',
    'E-0201.75',
    'Boya Castillete',
    'Si',
    'DR',
    3.00,
    'L 0.5 oc 2.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25843.5',
    '',
    'Boya Cilíndrica roja',
    'Si',
    'Ct',
    1.00,
    'L 0,5 + oc 0,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25843.8',
    '',
    'Boya Cilíndrica roja',
    'Si',
    'Ct. R',
    1.00,
    'L 0,5 + oc 0,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25844',
    '',
    'Boya oceanográfica Castillete amarilla y marca de tope',
    'RTU 37',
    'GpD (4)A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25920',
    'E-0204.2',
    'Baliza TPS 3.3',
    'RTU 13',
    'GpD (4) V',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25940',
    'E-0204',
    'Baliza TPS 3.3',
    '',
    'GpDR',
    3.00,
    'L 0.5 oc 2.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26020',
    'E-0206.7',
    'Baliza Tronco piramidal negro-amarillo con marca de tope.',
    'No',
    'GpRp (6) B',
    10.00,
    '[(L 0.25 oc 0.25) x6] L 2 oc 5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26021',
    'E-0208.6',
    'Baliza TPS 3.3',
    '',
    'GpD(2)V',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26025',
    'E-0208.65',
    'Baliza TPS 3.3',
    '',
    'GpD(2)R',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26035',
    'E-0208.75',
    'Baliza Tronco piramidal metálica',
    '',
    'GpD(3)V',
    9.00,
    '[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26041',
    'E-0208.8',
    'Baliza Tronco piramidal metálica',
    '',
    'GpD(3)R',
    9.00,
    '[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26045',
    'E-0208.84',
    'Baliza Tronco piramidal metálica',
    '',
    'CtV',
    1.00,
    'L 0.3 oc 0.7'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26046',
    'E-0208.86',
    'Baliza Tronco piramidal metálica',
    '',
    'CtR',
    1.00,
    'L 0.3 oc 0.7'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26047',
    '',
    'Baliza Torre cilíndrica verde',
    'RTU 35',
    'GpD(2)V',
    7.00,
    'L0,5+oc1,5+L0,5+oc4,'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26047.1',
    '',
    'Baliza Cilíndrica con base cónica, negra amarilla negra con marca tope',
    'Si.',
    'GpRp(3)B',
    5.00,
    '[(L0,25 oc0,25)x2]+L0,25 oc3,75'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26047.2',
    '',
    'Baliza Poliester reforzado con fibra de vidrio',
    'RTU 33',
    'RpB',
    0.50,
    'L 0,25 + oc 0,25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26048',
    '',
    'Baliza Torre cilíndrica con base cónica roja',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26048.1',
    '',
    'Baliza Torre cilíndrica con base cónica roja',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26048.2',
    '',
    'Boya Elastomero (Espuma polietileno cubierta de poliuretano)',
    'RTU 31',
    'RpB',
    0.50,
    'L0.25+  oc 0.25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26048.3',
    '',
    'Boya Elastomero (Espuma polietileno cubierta de poliuretano)',
    'RTU 32',
    'RpB',
    0.50,
    'L02.5 + oc 0.25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26049',
    '',
    'Boya Fibra de vidrio',
    'No',
    'CtR',
    0.50,
    'L0,25 oc 0,25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26050',
    'E-0199.9',
    'Baliza Acero',
    'No',
    'CtR',
    0.00,
    'L0,25 oc 0,25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26052',
    'E-0199.91',
    'Baliza Acero',
    'No',
    'CtV',
    0.50,
    'L0,25 oc 0,25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26052.5',
    '',
    ' Cilíndrica',
    'Si',
    'D A',
    5.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26052.7',
    '',
    ' Cilíndrica',
    'Si',
    'D A',
    5.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26055',
    'E-0199.92',
    'Baliza Poste rojo con paneles cuadrangulares adosados',
    '',
    'DR',
    5.00,
    'L0.5 oc4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26055.5',
    'E-0199.925',
    'Baliza Poste rojo, verde, rojo con paneles triangulares adosados',
    'No',
    'GpD(2+1)R',
    14.50,
    'L0.5 oc1 L0.5 oc3 L0.5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26055.6',
    'E-0199.926',
    'Baliza Poste cilindrico rojo con paneles cuadrangulares adosados.',
    '',
    'GpD(2)R',
    7.00,
    'L0.5 oc1.5 L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26056',
    'E-0199.93',
    'Baliza Poste verde con paneles triangulares adosados',
    '',
    'DV',
    5.00,
    'L0.5 oc4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058',
    'E-0199.94',
    'Baliza Poste verde, rojo, verde con paneles triangulares adosados',
    'No',
    'GpD(2+1)V',
    14.50,
    'L0.5 oc1 L0.5 oc3 L0.5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.1',
    'E-0199.945',
    'Baliza Poste cilindrico amarillo con paneles triangulares adosados',
    '',
    'DA',
    5.00,
    'L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.15',
    '',
    'SEMaFORO Panel metalico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.16',
    '',
    'SEMÁFORO Panel metálico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.17',
    '',
    'SEMÁFORO Panel metálico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.2',
    'E-0199.96',
    'Baliza Poste cilindrico verde.',
    '',
    'GpD(2)V',
    7.00,
    'L0.5 oc1.5 L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.4',
    'E-0199.97',
    'Baliza Poste cilíndrico rojo.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0.5 oc1.5)x2]+ L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.6',
    'E-0199.98',
    'Baliza Poste cilíndrico verde.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0.5 oc1.5)x2]+ L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.8',
    'E-0199.99',
    'Baliza Poste cilíndrico rojo.',
    'No',
    'GpD(4)R',
    11.00,
    '[(L0.5 oc1.5)x3]+ L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26060',
    '',
    'Boya Castillete amarillo Marca de tope un aspa amarilla',
    'Sí',
    'GpD(4)A',
    1.00,
    'borrada por error'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26150',
    'E-0209.6',
    'Baliza Torrete cilíndrica roja blanca',
    'SPC88',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26160',
    'E-0209.7',
    'Baliza Torrete cilíndrica verde blanca',
    'SPC88',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26190',
    '',
    'Boya Espeque negra roja negra',
    'no',
    'GpD(2)B 5s',
    5.00,
    'L0,5 oc1 L0,5 oc3'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26200',
    'E-0210',
    'Baliza Torreta cilíndrica verde sobre caseta de hormigón',
    '',
    'GpD(2)V',
    5.00,
    'L0,5 oc0,7 L0,5 oc3'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26202',
    'E-0210.73',
    'Baliza Torreta troncocónica verde blanca',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26205',
    'E-0210.74',
    'Baliza Columna cilíndrica cardinal E negro.',
    '',
    'GpRp(3)B',
    5.00,
    '[(L0,25 oc0,25)x2]+L0,25 oc3,'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26220',
    'E-0210.5',
    'Baliza Torreta cilíndrica roja sobre caseta de hormigón',
    '',
    'GpD(2)R',
    5.00,
    'L0,5 oc0,7 L0,5 oc3'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26230',
    'E-0210.7',
    'Baliza Columna cuadrangular roja adosada a muro azul.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26270',
    '',
    'Boya Castillete amarillo ( X )',
    'NO',
    'GpD(4)A ',
    11.00,
    '[ ( L0,5 oc1,5 ) x 3 ] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26285',
    'E-0210.75',
    'Baliza Moncada',
    'RTU 38 (5 hilos)',
    'DV',
    5.00,
    'L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26290',
    'E-0210.9',
    'Baliza TPS 3.3',
    '',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26311',
    'E-0210.8',
    'Baliza TPS 3.3',
    'RTU 19 (5 hilos)',
    'GpRp(6)+DLB ',
    10.00,
    '[(L0,25 oc0,25)x 6] L2 oc5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26312',
    'E-0211',
    'Baliza TPS 3.3',
    '',
    'DR ',
    5.00,
    'L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26313',
    '',
    'Boya Castillete  amarillo ( X )',
    'RTU 28 (5 hilos)',
    'GpD(4)A',
    11.00,
    '[ ( L0,5 oc1,5 )x 3 ] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26314',
    'E-0212.1',
    'Baliza TPS 3.3',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26320',
    '',
    'Boya Castillete verde( ^ )',
    'No lo necesita',
    'GpD(3)V',
    9.00,
    '[ ( L0,5 oc1,5 ) x 2 ]  L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26325',
    'E-0212.2',
    'Baliza TPS 3.3',
    'RTU 11 (5 hilos)',
    'GpD(2+1)R',
    5.00,
    'L0,5 oc1 L0,5 oc3 L0,5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26326',
    '',
    'Baliza MTP-35',
    '',
    'Ct V',
    1.00,
    'L 0.5 oc 0.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26360',
    '',
    'Boya Castillete verde(^ )',
    'RTU 08 (3 hilos)',
    'GpD(4)V',
    11.00,
    '[ ( L0,5 oc1,5 ) x 3 ] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26380',
    'E-0214',
    'Baliza TPS 3.3',
    'RTU 40 (5 hilos)',
    'GpD(4)R',
    11.00,
    '[ ( L0,5 oc1,5 ) x 3 ] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26390',
    'E-0214.6',
    'Baliza TPS 3.3',
    '',
    'DV',
    3.00,
    'L0,5 oc2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26392',
    'E-0214.7',
    'Baliza TPS 3.3',
    '',
    'DR',
    3.00,
    'L0,5 oc2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450',
    'E-0212.6',
    'Baliza Torre cilíndrica ',
    'RTU 39 (5 hilos)',
    'GpCt(3)B',
    10.00,
    '[(L0,3 oc0,8) x2 ] L0,3 oc7,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26460',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA ',
    6.00,
    'L0,7 oc1,8 = 2,5 s (Sincronizada con el resto de '
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26460.1',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA ',
    6.00,
    'L0,7 oc1,8 = 2,5 s (Sincronizada con el resto de '
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26460.2',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA ',
    6.00,
    'L0,7 oc1,8 = 2,5 s (Sincronizada con el resto de '
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26460.3',
    '',
    'Boya De castillete amarilla y marca de tope  X amarilla',
    '',
    'DA ',
    6.00,
    'L0,7 oc1,8 = 2,5 s (Sincronizada con el resto de '
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26470',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A  (Sincronizada con 26471, 26472 y 26473)',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26471',
    '',
    'Boya De castillete amarilla marca de tope  X amarilla',
    '',
    'GpD(4)A  (Sincronizada con 26470, 26472 y 26473)',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26472',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A  (Sincronizada con 26470, 26471 y 26473)',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26473',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A  (Sincronizada con 26470, 26471 y 26472)',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26500',
    'FCanet',
    'Faro',
    'Si',
    'GpD(2)',
    10.00,
    'L0,5  oc 0,2  L0,5  oc 7'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26504',
    'E-0217',
    'Baliza Columna verde con la base blanca.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26508',
    'E-0217.2',
    'Baliza Columna verde con la base blanca.',
    '',
    'GpD(4)V',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26510',
    'E-0217.4',
    'Baliza Columna roja con la base blanca.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26512',
    'E-0217.5',
    'Baliza Columna roja con la base blanca.',
    '',
    'GpD(4)R',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cochecito
# ------------------------------------------------------------

INSERT INTO
  `cochecito` (`usuario`, `fecha`, `horaE`, `horaS`, `motivo`)
VALUES
  (
    'adrian',
    '2019-06-03',
    '08:00',
    '12:45',
    'Revision Balizamiento'
  );
INSERT INTO
  `cochecito` (`usuario`, `fecha`, `horaE`, `horaS`, `motivo`)
VALUES
  (
    'adrian',
    '2019-06-04',
    '08:21',
    '14:21',
    'Desplazamiento al Faro de Cullera'
  );
INSERT INTO
  `cochecito` (`usuario`, `fecha`, `horaE`, `horaS`, `motivo`)
VALUES
  (
    'adrian',
    '2019-06-06',
    '08:15',
    '12:21',
    'Revision Balizamiento'
  );
INSERT INTO
  `cochecito` (`usuario`, `fecha`, `horaE`, `horaS`, `motivo`)
VALUES
  (
    'adrian',
    '2019-06-07',
    '08:07',
    '14:22',
    'Revision Balizamiento'
  );
INSERT INTO
  `cochecito` (`usuario`, `fecha`, `horaE`, `horaS`, `motivo`)
VALUES
  (
    'adrian',
    '2019-06-10',
    '08:20',
    '14:30',
    'Revision Balizamiento'
  );
INSERT INTO
  `cochecito` (`usuario`, `fecha`, `horaE`, `horaS`, `motivo`)
VALUES
  (
    'adrian',
    '2019-06-11',
    '08:15',
    '14:25',
    'Desplazamiento al Faro de Cullera'
  );
INSERT INTO
  `cochecito` (`usuario`, `fecha`, `horaE`, `horaS`, `motivo`)
VALUES
  (
    'adrian',
    '2019-06-12',
    '08:15',
    '13:30',
    'Revision Boyas Valencia'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: documentos
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: eliminados
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: inventario
# ------------------------------------------------------------

INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    1,
    'baliza',
    'BDL300 G',
    3,
    6,
    4,
    'Baliza modelo BDL300 color verde'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    2,
    'baliza',
    'BDL300 R',
    1,
    6,
    4,
    'Baliza modelo BDL300 color roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    3,
    'baliza',
    'Optica BDL300',
    2,
    6,
    4,
    'Solo la óptica para modelo BDL300'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    4,
    'baliza',
    'Optica BDL120',
    20,
    6,
    4,
    'Solo la óptica para modelo BDL120'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    5,
    'baliza',
    'BDL120 R',
    1,
    6,
    4,
    'Baliza modelo BDL120 color Roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    6,
    'baliza',
    'Optica BDL120 2018',
    NULL,
    6,
    4,
    'Solo la óptica para modelo BDL120 año 2018'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    8,
    NULL,
    'Panel 20w 36cmx31xm',
    1,
    5,
    2,
    'Panel solar de 20w de medidas 36cmx31'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    9,
    NULL,
    'Panel 10w 27cmx48cm',
    3,
    5,
    2,
    'Panel solar de 10w de medidas 27cmx48'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    10,
    'baliza',
    'BDL 120 HI W',
    1,
    5,
    3,
    'Baliza de alta intensidad color blanco'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    11,
    'baliza',
    'MCL 120 Y',
    1,
    5,
    3,
    'Baliza color amarillo'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    12,
    'baliza',
    'MCL 120 W',
    1,
    5,
    3,
    'Baliza color blanco'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    13,
    NULL,
    'MBL 160 Y',
    2,
    5,
    3,
    'Baliza color amarillo'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    14,
    'baliza',
    'BDL 120 G',
    1,
    5,
    4,
    'Baliza BDL120 de color verde'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    15,
    'baliza',
    'BDL 120 R',
    1,
    5,
    4,
    'Baliza BDL120 de color roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    16,
    'baliza',
    'BDL 120 W',
    1,
    5,
    4,
    'Baliza BDL120 de color blanca'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    17,
    NULL,
    'Corona amarilla completa',
    1,
    5,
    4,
    'Una corona amarilla entera'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    18,
    NULL,
    'Corona roja completa',
    3,
    5,
    4,
    'Una corona roja entera'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    19,
    NULL,
    'Corona verde completa',
    3,
    5,
    4,
    'Una corona verde entera'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    20,
    NULL,
    'Piña verde de 50w',
    1,
    5,
    4,
    'Una piña verde 50w'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    21,
    NULL,
    'Piña blanca de 50w',
    1,
    5,
    4,
    'Una piña blanca 50w'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    22,
    'baliza',
    'Discos amarillos',
    5,
    5,
    4,
    'Discos amarillos 02827'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    25,
    NULL,
    'Panel 66w 66x78',
    6,
    4,
    2,
    'Panel solar de 66w de medidas 66cmx78cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    26,
    NULL,
    'Cuandro de Anfer MOSCAD',
    1,
    4,
    2,
    'Un cuadro completo de Anfer para telecomunicaciones'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    27,
    'baliza',
    'MBL 160 R',
    1,
    4,
    3,
    'Baliza MBL160 de color roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    28,
    'baliza',
    'MCL 140 G',
    1,
    4,
    3,
    'Baliza MCL140 de color verde'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    29,
    'baliza',
    'BDL 120 Y',
    1,
    4,
    3,
    'Baliza BDL120 de color amarilla'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    30,
    'baliza',
    'BDL 120 Y',
    2,
    4,
    4,
    'Baliza BDL120 de color amarilla'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    31,
    NULL,
    'Panel 95w 66x78',
    3,
    3,
    2,
    'Panel solar de 95w de medidas 66cmx78cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    32,
    NULL,
    'Antena GPS',
    1,
    4,
    2,
    'Antena GPS marca Garmin'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    33,
    'baliza',
    'BDL 120 R',
    4,
    3,
    3,
    'Baliza BDL120 de color roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    34,
    'baliza',
    'BDL 120 R old',
    1,
    3,
    3,
    'Baliza BDL120 de color roja vieja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (35, 'herramienta', 'Radial', 1, 3, 4, 'Radial');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (36, NULL, 'Analizador de Baterias', 1, 3, 4, '');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    37,
    NULL,
    'Taladro Metabo',
    1,
    3,
    4,
    'Taladro Metabo 18LT'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    38,
    NULL,
    'Taladro Bosch',
    1,
    3,
    4,
    'Taladro Bosch GST-60P'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    39,
    NULL,
    'Sistema Alimentacion',
    3,
    2,
    2,
    'Sistema alimentacion C20'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    40,
    'cargador',
    'Cargador',
    9,
    2,
    2,
    'Blue Power Charger ISA'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    41,
    NULL,
    'BKL 120 W',
    1,
    2,
    3,
    'Baliza BKL 120 blanca'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    42,
    NULL,
    'BKL 120 Y',
    1,
    2,
    3,
    'Baliza BKL 120 amarilla'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    43,
    'baliza',
    'BDL 120 G',
    3,
    2,
    3,
    'Baliza BDL 120 verde'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (44, 'destellador', 'DES22', 6, 2, 4, 'Destellador D22');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (45, 'destellador', 'DES33', 1, 2, 4, 'Destellador D33');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    46,
    'piezas',
    'Tarjeta BKL120',
    2,
    2,
    4,
    'Tarjeta BKL 120'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    47,
    'baliza',
    'Disco LEDs Y',
    30,
    2,
    4,
    'Disco LEDs amarillo'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    48,
    'baliza',
    'Disco LEDs G',
    30,
    2,
    4,
    'Disco LEDs verde'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    49,
    'baliza',
    'Disco LEDs W',
    3,
    2,
    4,
    'Disco LEDs blanco'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    50,
    'baliza',
    'Disco LEDs R',
    22,
    2,
    4,
    'Disco LEDs rojo'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    51,
    'bateria',
    'Bateria SB6',
    6,
    1,
    1,
    'Bateria SB6 de 200Ah medidas 24x19cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    52,
    NULL,
    'Grupo monofasico',
    1,
    1,
    1,
    'Grupo monofasico Ayerbe de 1,5kw'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    53,
    'cargador',
    'Cargador Bateria',
    1,
    1,
    1,
    'Cargador bateria Krauser 20A'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    54,
    'bateria',
    'Bateria SB12',
    7,
    1,
    2,
    'Bateria SB6 de 100Ah medidas 24x19cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    55,
    'bateria',
    'AS12V',
    3,
    1,
    3,
    'Bateria de 10Ah 15x10cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    56,
    'bateria',
    'AS06V',
    3,
    1,
    3,
    'Bateria de 10Ah 15x5cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    57,
    'regulador',
    'PR2020 STECA',
    3,
    1,
    4,
    'Regulador carga fotovoltaica PR2020 STECA'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    58,
    'regulador',
    'PRS 2020 STECA',
    2,
    1,
    4,
    'Regulador carga fotovoltaica PRS2020 STECA'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    59,
    'regulador',
    'PR2020 STECA IP65',
    1,
    1,
    4,
    'Regulador carga fotovoltaica PR2020 STECA IP65'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    60,
    'herramienta',
    'Soldador',
    1,
    1,
    4,
    'Soldador portatil Fronius TransPocket 1500'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    73,
    NULL,
    'Pintura Spray VERDE',
    8,
    5,
    1,
    'RAL 6038 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    74,
    'pintura',
    'Pintura Spray ROJO',
    8,
    5,
    1,
    'RAL 3024 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    75,
    'pintura',
    'Pintura Spray BLANCO',
    8,
    5,
    1,
    'RAL 9016 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    76,
    'pintura',
    'Pintura Spray AMARILLO',
    8,
    5,
    1,
    'RAL 1023 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    77,
    'pintura',
    'Pintura Spray NEGRO',
    8,
    5,
    1,
    'RAL 9017 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (78, NULL, 'Disolvente', 5, 5, 1, '');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lampara
# ------------------------------------------------------------

INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25460', 0, 0, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25470', 0, 0, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25530',
    7,
    15,
    7.00,
    'DES 33 MaqVal. Bola leds 50 w Óptica300 mm',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25545',
    3,
    2,
    1.00,
    'Des 33 Maq. Val.Bola de leds de 50 W ÓpticaFresnel 300mm',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25552',
    4,
    6,
    3.00,
    'DES 22 Maq. Val.  8 coronas de leds  Óptica BDL 120       ',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25554', 2, 2, 1.00, 'MCL 160 (MSM)', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25555',
    2,
    4,
    1.00,
    'DES 22 Maq. Val.  4 coronas de leds  Óptica BDL 120',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25560',
    2,
    4,
    1.00,
    'DES 22 LMV   4 coronas de leds  Óptica BDL 120',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25563', 2, 3, 1.00, 'MBL 160 (MSM)', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25564', 3, 3, 1.00, 'MBL 160 (MSM)', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25565',
    3,
    5,
    1.00,
    'DES 22 LMV     2 discos de leds    Óptica BDL 120',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25570',
    3,
    5,
    1.00,
    'DES 22 LMV  2 discos de leds  Óptica BDL 120',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25590',
    7,
    10,
    5.00,
    'BDL 300 LMV Leds 18w. DES 22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25600',
    7,
    10,
    3.00,
    'BDL 120 LMV DES 22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25640', 0, 0, 0.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25650', 14, 28, 19.00, '1', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25665',
    5,
    7,
    4.00,
    'AUTONOMA MCL 140 MSM (3MN)',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25667',
    2,
    3,
    1.00,
    'Autónoma SL60 SEALITE (1MN)',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25700', 10, 20, 20.00, '2', 2.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25720', 5, 21, 5.00, 'BDL 300 50w.', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25721',
    4,
    6,
    1.00,
    'BDL 120 cuatro coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25730',
    4,
    4,
    3.00,
    'BDL 120 dos coronas',
    1000.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25740',
    4,
    4,
    5.00,
    'BDL 120 ocho coronas.    ',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25761',
    4,
    4,
    3.00,
    'BDL 120 una corona HI (DES33).',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25765',
    4,
    4,
    3.00,
    'BDL 120 una corona HI (DES33).',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25768', 3, 3, 2.00, 'MCL 160', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25774', 9, 21, 3.00, 'BDL 300 50w.', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25776',
    3,
    12,
    3.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25777',
    4,
    6,
    3.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25800',
    3,
    5,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25820',
    4,
    6,
    3.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25830',
    6,
    8,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25831',
    2,
    5,
    1.00,
    'BDL HI dos coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25840',
    4,
    7,
    3.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25841',
    3,
    3,
    3.00,
    'BDL 120 (ocho coronas de led)',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25842', 4, 5, 1.00, 'MCL 200', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25842.5',
    2,
    0,
    1.00,
    'MCL 160 12% divergencia',
    109.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25843', 2, 0, 1.00, 'MCL 200', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25843.5', 2, 0, 1.00, 'MCL 140', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25843.8', 2, 0, 1.00, 'MCL 140', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25844',
    3,
    3,
    3.00,
    'BDL 120 dos. coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25920',
    4,
    6,
    1.00,
    'BDL 120 ocho coronas.  ',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25940',
    4,
    6,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26020',
    3,
    9,
    3.00,
    'BDL 120 LC-b/ HI.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26021',
    4,
    9,
    3.00,
    'BDL 300 Piña de leds de 25W.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26025',
    4,
    5,
    1.00,
    'BDL 300 Piña de leds de 25W.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26035',
    3,
    5,
    1.00,
    'BDL 120 ocho coronas. ',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26041',
    3,
    5,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26045',
    4,
    8,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26046',
    4,
    5,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26047', 5, 17, 5.00, 'BDL 300', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26047.1', 4, 16, 3.00, 'BDL 120 HI', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26047.2', 4, 16, 3.00, 'BDL 120 HI', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26048', 5, 12, 5.00, 'BDL 300', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26048.1', 4, 9, 3.00, 'BDL 120', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26048.2', 3, 0, 3.00, 'MBL 160', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26048.3', 3, 0, 3.00, 'MBL 160', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26049', 2, 2, 3.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26050', 3, 9, 5.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26052', 0, 6, 3.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26052.5', 1, 0, 1.00, 'MCL 100', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26052.7', 1, 0, 1.00, 'MCL 100', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26055', 0, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26055.6', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26056', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.1', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.15', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.16', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.17', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.2', 3, 5, 1.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.4', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.6', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.8', 3, 5, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26060', 0, 0, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26190', 4, 4, 3.00, 'MCL140', 10.10, 2.30, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26270',
    2,
    2,
    3.00,
    'MCL-140  SN 295  (Autoalimentada)',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26285',
    5,
    20,
    5.00,
    ' BDL-300 (50w)/ DES-22',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26290',
    4,
    7,
    2.00,
    'BDL-120 (3 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26311',
    4,
    17,
    3.00,
    'BDL-120 (3 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26312',
    4,
    17,
    3.00,
    'BDL-120 (8 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26313',
    5,
    5,
    3.00,
    'BDL-120 (5 coronas) / DES-33',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26314',
    4,
    12,
    3.00,
    'BDL-120 (4 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26320',
    4,
    4,
    3.00,
    'BDL-120 (4 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26325',
    4,
    8,
    3.00,
    'BDL-120 (8 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26326', 5, 7, 1.00, 'MBL-160', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26360',
    4,
    4,
    3.00,
    'BDL-120 (8 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26380',
    4,
    6,
    3.00,
    'BDL-120 (8 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26390',
    4,
    6,
    1.00,
    'BDL-120 HI (2 coronas) / DES-33',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26392',
    4,
    6,
    1.00,
    'BDL-120 HI (2 coronas) / DES-33',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450',
    6,
    12,
    5.00,
    'BDL-300 (Piña Led 50w) / DES-33',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26460', 0, 0, 3.00, 'Si', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26470', 0, 0, 3.00, 'Si', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26500', 10, 20, 20.00, '0', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26508',
    2,
    4,
    1.00,
    'BDL 120 dos coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26512', 2, 4, 1.00, 'BDA 155 LMV', 0.00, NULL, NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: localizacion
# ------------------------------------------------------------

INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25460',
    'C.N. Oliva',
    1,
    'Extremo dique de abrigo',
    '38 º59.004\' N',
    '00º 05.490\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25470',
    'C.N. Oliva',
    2,
    'Extremo contradique',
    '38º55,989\' N',
    '00º 05,559\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25530',
    'Puerto de Gandía',
    1,
    'Extremo dique norte',
    '38º 59.712\' N',
    '00º 8.666\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25545',
    'Puerto de Gandía',
    2,
    'Extremo del contradique',
    '38º 59.661\' N',
    '00º 8.813\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25552',
    'Puerto de Gandía',
    3,
    'Extremo Dique Sur',
    '38º 59.736\' N',
    '00º 9.108\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25554',
    'Puerto de Gandía',
    4,
    'Boya bifurcación',
    '38º 59.789\' N',
    '00º 9.173\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25555',
    'Puerto de Gandía',
    5,
    'Dársena deportiva a estribor.',
    '38º 59.815\' N',
    '00º 9.154\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25560',
    'Puerto de Gandía',
    6,
    'Dársena deportiva Extremo contradique.',
    '38º 59.813\' N',
    '00º 9.181\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25563',
    'Puerto de Gandía',
    7,
    'Pantalan A - extremo - muelle Borgia',
    '38º 59.720\' N',
    '00º 9.359\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25564',
    'Puerto de Gandía',
    8,
    'Pantalan B - extremo - muelle Borgia',
    '38º 59.662\' N',
    '00º 9.527\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25565',
    'Puerto de Gandía',
    9,
    'Muelle final encauzamiento',
    '38º 59.639\' N',
    '00º 9.560\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25570',
    'Puerto de Gandía',
    10,
    'Muelle frutero angulo NE',
    '38º 59.708\' N',
    '00º 9.259\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25590',
    'Desembocadura Júcar Cullera',
    1,
    'Malecón Norte a 20 m del extremo',
    '39º 09.079\' N',
    '00º 14.048\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25600',
    'Desembocadura Júcar Cullera',
    2,
    'Malecón Sur a 39 m del extremo',
    '39º09,034\' N',
    '00º 14,164\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25620',
    'Desembocadura Júcar Cullera',
    3,
    'Puente de la Bega, en el mejor lugar de paso',
    '39º 09.450\' N',
    '00º 15.138\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25640',
    'Al norte de la desembocadura del Júcar',
    4,
    'Escollo El Moro',
    '39º 09.605\' N',
    '00º 13.849\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25650',
    'Gandia',
    0,
    'Extremo del cabo de Cullera',
    '39º 11.188´N',
    '00º 13.016\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25660',
    'Gola del Perelló',
    1,
    'Extremo Dique Norte',
    '39º16,723\' N',
    '00º 16,359\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25665',
    'Gola del Perelló',
    2,
    'Extremo Dique sur',
    '39º16,695\' N',
    '00º 16,374\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25667',
    'Gola del Perelló',
    3,
    'Extremo espigón interior.',
    '39º16,719\' N',
    '00º 16,406\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25700',
    'Faro de Valencia',
    1,
    'Angulo del dique de la ampliacion norte',
    '39º 27,297´ N',
    '000º 17,161´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25720',
    'Puerto de Valencia.',
    1,
    'Extremo dique del Este',
    '39º 26.028´N',
    '000º 18.171´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25721',
    'Puerto de Valencia.',
    3,
    'Martillo dique del Este',
    '39° 26.139\' N',
    '00° 18.349\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25730',
    'Puerto de Valencia.',
    25,
    'Exterior, en alineación contradique RCNV.',
    '39º 25.219´N',
    '00º 18.218´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25740',
    'Puerto de Valencia.',
    2,
    'Canal de entrada Br.',
    '39º 25.582´N',
    '000º 18.187´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25761',
    'Puerto de Valencia.',
    5,
    'Canal, ángulo Este del contradique.',
    '39º 25.898´N',
    '000º 18.465´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25765',
    'Puerto de Valencia.',
    6,
    'Canal, ángulo Norte del contradique.',
    '39º 26.143´N',
    '00º 18.822´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25768',
    'Puerto de Valencia.',
    10,
    'Canal de entrada Er. frente Xitá.',
    '39º 26.401\' N',
    '00º 18.684\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25774',
    'Puerto de Valencia.',
    4,
    'Contra dique, ángulo Este',
    '39º 25.840´N',
    '00º18.561´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25776',
    'Puerto de Valencia.',
    7,
    'Extremo del contradique.',
    '39° 26.106\' N',
    '00° 18.811\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25777',
    'Puerto de Valencia.',
    8,
    'Extremo del contradique ángulo interior.',
    '39º 26.083´N',
    '00º 18.847´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25800',
    'Puerto de Valencia.',
    9,
    'Roja xita.',
    '39º 26.527´N',
    '00º 18.635´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25820',
    'Puerto de Valencia.',
    11,
    'Verde Xitá.',
    '39º 26.516´N',
    '00º 18.760´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25820.1',
    'Puerto de Valencia.',
    12,
    'Canal de entrada Er. Xitá.',
    '39º 26.512´N',
    '00º 18.779´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25830',
    'Puerto de Valencia.',
    20,
    'Muelle Transversal Costa.',
    '39º 26.245´N',
    '00º 19.181´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25831',
    'Puerto de Valencia',
    21,
    'Muelle Transversal Costa en Duque de Alba',
    '39º 26,252´N',
    '000º 19,145´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25840',
    'Puerto de Valencia.',
    14,
    'Muelle Sur.',
    '39º 26.589´N',
    '00º 18.984´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25841',
    'Puerto de Valencia.',
    15,
    'Extremo del muelle sur.',
    '39º 26.590´N',
    '00º 18.938´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25842',
    'Puerto de Valencia.',
    16,
    'Er. Dársena de servicios Náuticos.',
    '39º 26.475´N',
    '00º 19.062´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25842.5',
    'Puerto de Valencia.',
    18,
    'Boya a Er. Bocana Dársena de Servicios Náuticos.',
    '39º 26.454´N',
    '00º 19.056´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25843',
    'Puerto de Valencia.',
    17,
    '1ª boya a Br. Dársena de Servicios Náuticos.',
    '39º 26.402´N',
    '00º 19.076´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25843.5',
    'Puerto de Valencia.',
    19,
    '2ª boya a Br. Dársena de Servicios Náuticos.',
    '39º 26.439´N',
    '00º 19.094´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25843.8',
    'Puerto de Valencia.',
    19,
    '3ª boya Br. Dársena de Servicios Náuticos',
    '39º 26.484\' N',
    '00º 19.093\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25920',
    'Puerto de Valencia.',
    22,
    'E. Turia Er.',
    '39º 26.901´N',
    '00º 19.284´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25940',
    'Puerto de Valencia.',
    23,
    'Br E.Turia.',
    '39º 26.990´N',
    '00º 19.237´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26020',
    'Puerto de Valencia.',
    26,
    'RCNV Contra dique ángulo Sur',
    '39º 25.242´N',
    '00º 19.052´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26021',
    'Puerto de Valencia.',
    27,
    'Er. Bocana R.C.N.V.',
    '39º 25.356´N',
    '00º 19.360´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26025',
    'Puerto de Valencia.',
    28,
    'Br.Bocana R.C.N.V.',
    '39º 25.427´N',
    '00º 19.411´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26035',
    'Puerto de Valencia.',
    30,
    'R.C.N.V. Verde interior',
    '39º 25,643´ N',
    '0º 19,773´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26041',
    'Puerto de Valencia.',
    29,
    'R.C.N.V. Bocana interior roja',
    '39º 25,595´ N',
    '0º 19,776´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26045',
    'Puerto de Valencia.',
    31,
    'Verde bocana D.E.M.',
    '39º 25.530´N',
    '00º 19.856´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26046',
    'Puerto de Valencia.',
    32,
    'Roja bocana D.E.M.',
    '39º 25.545´N',
    '00º 19.884´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26047',
    'Puerto de Valencia.',
    33,
    'Er.Extremo dique de abrigo de la ampliación N',
    '39º 26.651´N',
    '00º 17.500´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26047.1',
    'Puerto de Valencia.',
    36,
    'Cambio de alineación del dique de abrigo de ampliación N',
    '39º 27.300´N',
    '00º 17.147´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26047.2',
    'Puerto de Valencia.',
    37,
    'Quiebro del nuevo dique de abrigo',
    '39º 27.512´N',
    '00º 17,748\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26048',
    'Puerto de Valencia.',
    34,
    '1ª Baliza de babor del nuevo contradique de la amp. N',
    '39º 26.679´N',
    '00º 17.930´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26048.1',
    'Puerto de Valencia.',
    35,
    '2ª baliza de Br, Extremo contradique de la ampliación N',
    '39º 27.070´N',
    '00º 17.719´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26048.2',
    'Puerto de Valencia.',
    100,
    'Darsena Norte',
    '39º 27.155´N',
    '00º 18.042\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26048.3',
    'Puerto de Valencia',
    101,
    'Darsena Norte',
    '39º 27.104´N',
    '00º 17.882\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26049',
    'Marina Real Juan Carlos I.',
    38,
    'Boya a babor Bocana Norte',
    '39º 27.850´N',
    '00º 18.509\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26050',
    'Marina Real Juan Carlos I.',
    39,
    'Extremo Dique de abrigo Bocana Norte',
    '39º 27.767´N',
    '00º 18.509\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26052',
    'Marina Real Juan Carlos I.',
    40,
    'Extremo Contradique Bocana Norte',
    '39º 27.665´N',
    '00º 18.632\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26055',
    'Marina Real Juan Carlos I.',
    41,
    'Espigón de cierre Extremo oeste Darsena Sur',
    '39º 27.599´N',
    '00º 18.753\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26055.5',
    'Marina Real Juan Carlos I',
    43,
    'Dique - Extremo - Darsena Sur',
    '39º 27.615´N',
    '00º 18.833\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26055.6',
    'Marina Real Juan Carlos I.',
    45,
    '1ª Baliza a babor Canal de Acceso',
    '39º 27.634´N',
    '00º 19.016\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26056',
    'Marina Real Juan Carlos I.',
    42,
    'Angulo Oeste- Darsena Norte - Explanada',
    '39º 27.668´N',
    '00º 18.755\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058',
    'Marina Real Juan Carlos I',
    44,
    'Espigón - Extremo - Darsena Auxiliar',
    '39º 27.677´N',
    '00º 19.002\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.1',
    'Marina Real Juan Carlos I.',
    51,
    'Angulo oeste - Darsena auxiliar',
    '39º 27.683´N',
    '00º 19.112\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.15',
    'Marina Semaforo a estribor - Puente móvil.',
    102,
    'Marina Real Juan Carlos I',
    '39º 27,683´ N',
    '000º 19.112´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.16',
    'Marina Semáforo a babor - Puente móvil',
    103,
    'Marina Real Juan Carlos I',
    '39º 27,638´ N',
    '000º 19.112´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.17',
    'Marina Semáforo sobre tablero del puente móvil',
    104,
    'Marina Real Juan Carlos I',
    '39º 27,666´ N',
    '000º 19.133´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.2',
    'Marina Real Juan Carlos I.',
    46,
    '1ª Baliza a estribor Canal de Acceso',
    '39º 27.685´N',
    '00º 19.328\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.4',
    'Marina Real Juan Carlos I.',
    47,
    '2ª Baliza a babor Darsena Auxiliar',
    '39º 27.642´N',
    '00º 19.315\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.6',
    'Marina Real Juan Carlos I.',
    48,
    '2ª Baliza a estribor Canal de acceso',
    '39º 27.617´N',
    '00º 19.505\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.8',
    'Marina Real Juan Carlos I.',
    49,
    '3ª Baliza a babor Darsena auxiliar',
    '39º 27.562´N',
    '00º 19.466\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26060',
    'Marina Real Juan Carlos I.',
    50,
    'Darsena interior, en el extremo de la rampa de varadero',
    '39º 27.669´N',
    '00º 19.560\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26150',
    'PORT-SAPLAYA',
    1,
    'Extremo dique Sur',
    '39º 30,614\' N',
    '00º 19,111\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26160',
    'PORT-SAPLAYA',
    2,
    'Extremo dique Norte',
    '39º 30,602\' N',
    '00º 19,065\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26190',
    'Port saplaya',
    3,
    'Señaliza pontona hundida',
    '39º 32.740\' N',
    '00º 16.940\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26200',
    'Pobla Farnals',
    1,
    'Extremo dique de Levante',
    '39º 33,496\' N',
    '00º 17,008\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26202',
    'Pobla Farnals',
    2,
    'Dique de Levante, angulo interior.',
    '39º 33,589\' N',
    '00º 17,026\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26205',
    'Pobla Farnals',
    3,
    'Ángulo exterior',
    '39º 33,767\' N',
    '00º 16,861\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26220',
    'Pobla Farnals',
    4,
    'Extremo espigón de playa.',
    '39º 33,520\' N',
    '00º 17,070\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26230',
    'Pobla Farnals',
    5,
    'Extremo muelle contradique.',
    '39º 33.617\' N',
    '00º 17.046\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26270',
    'Puerto de Sagunto - UNIÓN FENOSA',
    14,
    'Emisario submarino',
    '39º 37.831\' N',
    '00º 13.528\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26285',
    'Puerto de Sagunto',
    1,
    'Extremo Dique de abrigo',
    '39º 37.830\' N',
    '00º 12.321\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26290',
    'Puerto de Sagunto',
    2,
    'Martillo Dique de abrigo',
    '39º 38.035\' N',
    '00º 12.372\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26311',
    'Puerto de Sagunto',
    3,
    'Contradique ( Angulo S )',
    '39º 37.754\' N',
    '00º 12.935\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26312',
    'Puerto de Sagunto',
    4,
    'Contradique ( Angulo E )',
    '39º 38.001\' N',
    '00º 12.715\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26313',
    'Puerto de Sagunto',
    5,
    'Talud contradique',
    '39º 38.060\' N',
    '00º 12.630\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26314',
    'Puerto de Sagunto',
    6,
    'Contradique ( Extremo )',
    '39º 38.264\' N',
    '00º 12.684\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26320',
    'Puerto de Sagunto',
    7,
    '1ª boya Canal Principal',
    '39º 38.590\' N',
    '00º 12.570\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26325',
    'Puerto de Sagunto',
    8,
    'Muelle noreste,extremo sur.',
    '39º 38.569\' N',
    '00º 12.746\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26326',
    'Puerto de Sagunto',
    15,
    'Muelle Norte Dos',
    '39º 38.562 N',
    '00º 12.805 W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26360',
    'Puerto de Sagunto',
    9,
    '2ª boya Canal Principal',
    '39º 38.920\' N',
    '00º 12.690\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26380',
    'Puerto de Sagunto',
    10,
    'Muelle Sur (Angulo)',
    '39º 38.858\' N',
    '00º 12.820\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26390',
    'Puerto de Sagunto',
    11,
    'Dársena pesquera (Dique)',
    '39º 39.134\' N',
    '00º 12.654\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26392',
    'Puerto de Sagunto',
    12,
    'Dársena pesquera (Contradique)',
    '39º 39.152\' N',
    '00º 12.622\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450',
    'Puerto de Sagunto',
    13,
    'Pantalán Sierra Menera',
    '39º 38.803\' N',
    '00º 11.664\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26460',
    'Cultivos marinos &quot;Costa Blanca&quot;',
    1,
    'Boya SW',
    '39º 38.422\' N',
    '00º 10.296\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26460.1',
    'Cultivos marinos &quot;Costa Blanca&quot;',
    2,
    'Boya NW',
    '39º 38.849\' N',
    '00º 10.445\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26460.2',
    'Cultivos marinos &quot;Costa Blanca&quot;',
    3,
    'Boya NE',
    '39º 38.941\' N',
    '00º 10.001\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26460.3',
    'Cultivos marinos &quot;Costa Blanca&quot;',
    4,
    'Boya SE',
    '39º 38.513\' N',
    '00º 09.853\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26470',
    'Cultivos marinos &quot;Acuimed&quot;',
    5,
    'Boya S',
    '39º 38.900\' N',
    '00º 10.600\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26471',
    'Cultivos marinos &quot;Acuimed&quot;',
    6,
    'Boya W',
    '39º 39.100\' N',
    '00º 10.900\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26472',
    'Cultivos marinos &quot;Acuimed&quot;',
    7,
    'Boya N',
    '39º 39.200\' N',
    '00º 10.800\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26473',
    'Cultivos marinos',
    8,
    'Boya E',
    '39º 39.031\' N',
    '00º 10.523\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26500',
    'Faro de Sagunto',
    1,
    'Cabo Canet',
    '39º 40,471´ N',
    '00º 12,460´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26504',
    'Canet de Berenguer',
    1,
    'Extremo dique de Levante',
    '39º 40.337\' N',
    '00º 12.063\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26508',
    'Canet de Berenguer',
    2,
    'Extremo Martillo',
    '39º 40.366\' N',
    '00º 12.073\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26510',
    'Canet de Berenguer',
    3,
    'Extremo Sur Contradique',
    '39º 40,370\' N',
    '00º 12,105\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26512',
    'Canet de Berenguer',
    4,
    'Extremo Norte Contradique',
    '39º 40.430\' N',
    '00º 12.093\' W'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: logs
# ------------------------------------------------------------

INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'elimado', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'delete from inventario where id=62'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'delete from inventario where id=63'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'delete from inventario where id=64'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'delete from inventario where id=65'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'delete from inventario where id=66'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'delete from inventario where id=67'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'delete from inventario where id=68'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item añadi',
    'insert into inventario values(NULL,\'fgg\',4,6,1,\'fg\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item añadi',
    'insert into inventario values(NULL,\'gjfgjfkj\',5,6,1,\'6\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'fgg 4 6 1 fg'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item elimi',
    'gjfgjfkj 5 6 1 6'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Mantenimie',
    'insert into mantenimiento values(25700,\'2019-06-05\',\'sfg\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25740,\'2019-06-05\',\'Se recupera la boya varada en la playa de pinedo\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'prueba\',2,5,3,\'e\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'p2\',2,5,3,\'3\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item eliminado',
    'delete prueba 2 5 3 e'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Item eliminado',
    'delete p2 2 5 3 3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray VERDE\',8,5,1,\'6038 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray ROJO\',8,5,1,\'RAL 3024 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray BLANCO\',8,5,1,\'RAL 9016 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray AMARILLO\',8,5,1,\'RAL 1023 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray NEGRO\',8,5,1,\'RAL 9017 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Disolvente\',5,5,1,\'\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=26285 AND fecha=\'2019-01-11\' AND mantenimiento=\'eSTOY CON GORRIZ\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'marcos',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2019-06-05\' AND mantenimiento=\'sfg\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'marcos',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2019-06-07\',\'sdd\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'marcos',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2019-06-07\' AND mantenimiento=\'sdd\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'marcos', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'marcos', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Canet de Berenguer&quot;, num_local=1,localizacion=&quot;Extremo dique de Levante&quot;,latitud=&quot;39º 40.337\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'pepe',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;E-0198&quot;, tipo=&quot;Faro&quot;,apariencia=&quot;GpD(3)&quot;,periodo=20.00,caracteristica=&quot;L'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'pepe',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Gandia&quot;, num_local=1,localizacion=&quot;Extremo del cabo de Cullera&quot;,latitud=&quot;39º 11.188´N&quot;,l'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=14, elevacion=28,alcanceNom=19.00,alcanceLum=0,linterna=&quot;1&quot;,candelasCalc=0, candelasInst=0 where nif=25650'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'pepe',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Gandia&quot;, num_local=0,localizacion=&quot;Extremo del cabo de Cullera&quot;,latitud=&quot;39º 11.188´N&quot;,l'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26190,\'2019-04-21\',\'Varada en playa norte Port Saplaya debido a fuerte temporal (Baja)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=26190 AND fecha=\'2019-04-21\' AND mantenimiento=\'Varada en playa norte Port Saplaya debido a fuerte temporal\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=4, elevacion=4,alcanceNom=3.00,alcanceLum=2.3,linterna=&quot;MCL140&quot;,candelasCalc=10.1, candelasInst=0.00 where nif=261'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-11\',\'07:56\',\'12:56\',\'asdd\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche borrado',
    'delete from cochecito where usuario=\'adrian\' AND fecha=\'2019-06-11\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-12\',\'08:13\',\'\',\'Revision balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-11\',\'08:14\',\'14:15\',\'Deplazamiento a Cullera\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-13\',\'06:00\',\'dfgdg\',\'06:00\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'\', horaE=\'08:14\',horaS=\'horaSout\',motivo=\'prueba\' where usuario=\'adrian\' AND fecha=\'2019-06-13\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'\', horaE=\'\',horaS=\'\',motivo=\'\' where usuario=\'adrian\' AND fecha=\'2019-06-12\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'2019-06-03\', horaE=\'08:00\',horaS=\'12:45\',motivo=\'Revision Balizamiento\' where usuario=\'adrian\' AND fecha=\'2019-09-13\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'2019-06-04\', horaE=\'08:21\',horaS=\'14:21\',motivo=\'Desplazamiento al Faro de Cullera\' where usuario=\'adrian\' AND fecha=\'2019'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-07\',\'08:07\',\'14:22\',\'Revision Balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-10\',\'08:20\',\'14:30\',\'Revision Balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-11\',\'08:15\',\'14:25\',\'Desplazamiento al Faro de Cullera\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-26 18:28:50',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-12\',\'08:15\',\'13:30\',\'Revision Boyas Valencia\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-26 18:28:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-10 10:26:23', 'user1', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-10 10:26:30', 'user1', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-10 10:26:56', 'prueba1', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-16 06:54:43',
    'user1',
    'LOGIN usuario',
    '1 user1 user1@user1.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-16 11:00:08',
    'user1',
    'LOGIN usuario',
    '1 user1 user1@user1.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 06:47:20',
    'user1',
    'LOGIN usuario',
    '1 user1 user1@user1.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:00:25',
    'user1',
    'INSERT balizamiento',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:01:09',
    'user1',
    'DELETE baliza',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:03:42',
    'user1',
    'INSERT balizamiento',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:04:49',
    'user1',
    'DELETE baliza',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:06:36',
    'user1',
    'INSERT balizamiento',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:08:41',
    'user1',
    'DELETE baliza',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:13:04',
    'user1',
    'INSERT balizamiento',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:27:40',
    'user1',
    'DELETE baliza',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:28:21',
    'user1',
    'INSERT balizamiento',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:28:55',
    'user1',
    'DELETE baliza',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:29:29',
    'user1',
    'INSERT balizamiento',
    '1111'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-17 07:29:35',
    'user1',
    'DELETE baliza',
    '1111'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mantenimiento
# ------------------------------------------------------------

INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1,
    '25530',
    '2004-06-01',
    'Instalación linterna nueva, Batería antigua (08/03/1999)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    2,
    '25530',
    '2008-06-01',
    'Cambio de cargador rectificador (avería)   '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    3,
    '25530',
    '2010-09-25',
    'Instalación de Litepipes de leds '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    4,
    '25530',
    '2014-04-14',
    'Cambio de batería (Fullmen Gel 110 amp/h del año 2009)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (5, '25530', '2016-11-10', 'Cambio de LDR.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    6,
    '25530',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    7,
    '25530',
    '2017-07-10',
    'Se sustituyen las dos LDR y se sanea la instalación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    8,
    '25545',
    '2004-06-02',
    'Instalación equipo nuevo Batería antigua (17/02/1999)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    9,
    '25545',
    '2009-04-02',
    'Instalación de Litepipes Cambio de baterías (Linterna y Litepipe)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    10,
    '25545',
    '2012-11-08',
    'Sustitución de una LDR, LDR averiada'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    11,
    '25545',
    '2016-08-05',
    'Linterna apagada. Se repara en el mismo día.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    12,
    '25545',
    '2016-09-12',
    'Se sustituye LDR y se modifica posición para evitar deslumbramientos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    13,
    '25545',
    '2016-11-15',
    ' Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    14,
    '25552',
    '2005-11-21',
    'Instalación en edificio caseta de bombas'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    15,
    '25552',
    '2010-05-21',
    'Instalación boya proviSíonal por obras   Se anula la baliza'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    16,
    '25552',
    '2011-08-12',
    'Instalación torre TPS Maqu. Val. En ángulo nuevo muelle'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    17,
    '25552',
    '2014-10-13',
    'Reparación del transceptor de radio Motorola GP 340 (Anfer) '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    18,
    '25552',
    '2014-10-13',
    'Restauración del firmvare de la RTU Motorola MOSCAD (Anfer)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    19,
    '25552',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    20,
    '25554',
    '2003-12-04',
    'Instalación boya pequeña BKL 120 Marca la bifurcación del club náutico'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    21,
    '25554',
    '2004-03-04',
    'Reparación del anclaje. Boya a la deriva'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    22,
    '25554',
    '2009-04-17',
    'Instalación boya grande usada BDL120 Sustit. a la antigua y más pequeña'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    23,
    '25554',
    '2011-10-26',
    'ReviSíón general de la boya. Todo correcto'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    24,
    '25554',
    '2013-05-21',
    'Revisión general. Flotador oxidado y un panel roto'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    25,
    '25554',
    '2013-07-15',
    'Sustitución de la óptica por deterioro'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    26,
    '25554',
    '2013-07-15',
    'Sustitución del destellador y la LDR por avería '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    27,
    '25554',
    '2013-10-11',
    'Sustitución de la boya en servicio por otra nueva de MSM (mod. EBM 15) y linterna (mod. MCL 160) con batería de 6 volt. Y 12 amp/hora.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    28,
    '25554',
    '2014-08-21',
    'Revisión general y limpieza (todo bien).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    29,
    '25554',
    '2015-09-07',
    'Revisión general (todo bien).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    30,
    '25554',
    '2016-08-10',
    'Revisión general (buen estado).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    31,
    '25554',
    '2019-04-10',
    'Se sacó para revisión. En sustitución se coloca una provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    32,
    '25555',
    '2005-10-27',
    'Instalación BDL 120 LMV'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    33,
    '25555',
    '2007-08-14',
    'Cambio de óptica. Rajas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    34,
    '25555',
    '2011-02-25',
    'Cambio de óptica. Rajas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    35,
    '25555',
    '2012-12-05',
    'Cambio de batería. Se instala una batería de gel de 100 amp/h'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    36,
    '25555',
    '2016-02-22',
    'Sustitución de la fuente de alimentación por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    37,
    '25555',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    38,
    '25555',
    '2018-05-31',
    'Se retira la linterna para reformar la señal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    39,
    '25555',
    '2018-06-06',
    'Se termina la reforma y se vuelve a instalar la linterna en su sitio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    40,
    '25555',
    '2018-06-19',
    'Se apaga por la noche y se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    41,
    '25555',
    '2018-06-20',
    'Se sustituye el equipo luminoso por avería del termistor. Se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    42,
    '25560',
    '2005-10-27',
    'Instalación BDL 120 LMV'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    43,
    '25560',
    '2007-08-11',
    'Cambio de óptica Grietas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    44,
    '25560',
    '2009-11-17',
    'Cambio de óptica Grietas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    45,
    '25560',
    '2012-03-01',
    'Cambio de óptica Grietas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    46,
    '25560',
    '2013-01-18',
    'Cambio de batería (Gel 120 amp/h - año 2009)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    47,
    '25560',
    '2013-01-18',
    'Cambio de destellador DES 22 por fallo'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (48, '25560', '2013-01-18', 'Cambio de LDR');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    49,
    '25560',
    '2013-09-13',
    'Cambio de tarjeta reguladora TR 355 del cargador de baterías.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    50,
    '25560',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    51,
    '25560',
    '2018-05-31',
    'Se retira la linterna para reformar la señal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    52,
    '25560',
    '2018-06-06',
    'Se termina la reforma y se vuelve a instalar la linterna en su sitio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    53,
    '25563',
    '2015-08-05',
    'Se instala nueva baliza y se comunica a SASEMAR y PPEE'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    54,
    '25564',
    '2015-08-05',
    'Se instala nueva baliza y se comunica a SASEMAR y PPEE'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    55,
    '25565',
    '2005-03-30',
    'Instalación BKL 120 en poste verde'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    56,
    '25565',
    '2008-06-24',
    'Cambio de linterna por avería. Se repara la retirada'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    57,
    '25565',
    '2009-02-03',
    'Cambio de destellador  por avería'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    58,
    '25565',
    '2010-02-05',
    'Instalación BDL 120 en torre troncopiramidal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (59, '25565', '2013-09-18', 'Cambio de LDR');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    60,
    '25565',
    '2015-08-05',
    'Cambio de característica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    61,
    '25565',
    '2016-09-10',
    'Se sustituye disco de leds en la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    62,
    '25565',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    63,
    '25565',
    '2016-12-30',
    'Se sustituye el regulador averiado y la batería descargada por otra usada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    64,
    '25565',
    '2913-01-31',
    'Cambio del regulador solar por avería'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    65,
    '25570',
    '2007-01-25',
    'Instalación BKL 120 en poste rojo'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    66,
    '25570',
    '2010-05-26',
    'Cambio de linterna completa'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    67,
    '25570',
    '2011-10-26',
    'Instalación BDL 120 en torre troncopiramidal nueva'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    68,
    '25570',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (69, '25570', '2017-05-12', 'Se sustituye la LDR.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    70,
    '25570',
    '2017-05-12',
    'Se sustituye la torre entera por oxidación de la base.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    71,
    '25650',
    '2019-01-03',
    'Se reactiva la alarma de intrusión del faro'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    72,
    '25650',
    '2019-03-11',
    'Se procedio al cierre y bloqueo de puertas de acceso a almacenes en el faro. En breve se instalaran verjas en las ventanas'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    73,
    '25650',
    '2019-04-23',
    'Se ajusta la puerta de acceso al Faro'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (74, '25650', '2019-05-07', 'Visita de Kgest');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    75,
    '25650',
    '2019-05-14',
    'Se actualiza el sistema de alarmas y se integra con una aplicacion movil SPC connect'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    76,
    '25650',
    '2019-05-14',
    'Se sustituyen las pilas de la puerta de acceso al faro'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    77,
    '25650',
    '2019-05-21',
    'Visita del técnico de sonido'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    78,
    '25650',
    '2019-06-04',
    'Puesta en marcha nueva Camara en la linterna del faro.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    79,
    '25660',
    '2020-04-22',
    '5 Se le pinta el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    80,
    '25665',
    '2020-01-30',
    '5 Un golpe de mar la derriva y queda fuera de servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    81,
    '25665',
    '2020-02-08',
    '6 Se retira y queda fuera de servicio por obras en el espigón.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    82,
    '25665',
    '2020-02-11',
    '6 Se restituye el sevicio aunque las obras no han finalizado. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    83,
    '25665',
    '2020-02-23',
    '5 Se instala un espeque provisional y se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    84,
    '25665',
    '2020-04-22',
    '5 Se monta el espeque rojo definitivo con el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    85,
    '25720',
    '2004-09-16',
    'Se instala tele-control de la baliza y dos lite-pipe.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    86,
    '25720',
    '2007-01-29',
    'Avería de la fuente de alimentación montada por ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    87,
    '25720',
    '2007-12-04',
    'reparar avería en lite-pipe.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    88,
    '25720',
    '2008-01-15',
    'Sustituir y repara fuente de alimentación 220/12v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    89,
    '25720',
    '2008-04-14',
    'Se pinta baliza Verde-blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    90,
    '25720',
    '2010-03-24',
    'Se sincroniza con la verde del martillo 25.721'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    91,
    '25720',
    '2011-05-04',
    'Sustituir fuente de alimentación por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    92,
    '25720',
    '2012-01-17',
    'Fallo de la linterna por tormenta, cambio de fuente de alimentación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    93,
    '25720',
    '2013-11-08',
    'Instalación de dos puntos de luz.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    94,
    '25720',
    '2014-11-21',
    'Se sincronizan los lite-pipes con la linterna principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (95, '25720', '2015-03-31', 'Se repinta la baliza.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    96,
    '25720',
    '2015-04-01',
    'Se repara la escotilla hidráulica de acceso a la cofa (taller mécanico).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (97, '25720', '2018-10-23', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    98,
    '25720',
    '2018-11-20',
    'Se sustituye la batería de la linterna principal por avería (cortocircuitada).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    99,
    '25721',
    '2007-09-27',
    'Se instala baliza con una linterna nuestra (APV) porque Enrique no tenía.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    100,
    '25721',
    '2008-04-04',
    'Se instala la nueva linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    101,
    '25721',
    '2010-03-24',
    'Se sincroniza con la 25.720'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    102,
    '25721',
    '2010-09-22',
    'Se descarga la batería por fallo de red 230v'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    103,
    '25721',
    '2013-11-08',
    'Sustitución del cuadro de acometida e instalación de punto de luz.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    104,
    '25721',
    '2015-04-01',
    ' Se repinta la torre de la baliza dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    105,
    '25721',
    '2016-09-27',
    ' Sustitución de la LDR nº 2 por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (106, '25721', '2018-10-16', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    107,
    '25730',
    '2004-04-16',
    'Se instala tele-control y sustituye la linterna de Balizamar por una BDL 120'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    108,
    '25730',
    '2006-12-12',
    'Se sustituye por reparación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    109,
    '25730',
    '2007-05-14',
    'Se fondea otra vez la boya original reparada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    110,
    '25730',
    '2008-01-04',
    'Sustituir linterna rota.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    111,
    '25730',
    '2008-05-15',
    'Reparar barandilla rota por siniestro.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    112,
    '25730',
    '2008-12-17',
    'Dos paneles rotos por temporal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    113,
    '25730',
    '2010-01-26',
    'Paneles rotos por temporal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    114,
    '25730',
    '2010-02-08',
    'Se cambia la característica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (115, '25730', '2010-10-28', 'Se sustituye la boya');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    116,
    '25730',
    '2010-11-22',
    'Alarma por fallo de comunicación del GPS (Se reinicializa). Fallos de comunicaciones por exceso de transmisiones. ANFER'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    117,
    '25730',
    '2011-01-03',
    'Se repara alarma de GPS (fallo de posicionamiento) ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    118,
    '25730',
    '2012-04-03',
    'Se sustituye para reparar paneles solares y mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    119,
    '25730',
    '2012-05-04',
    'Se sustituye un panel destruido por la tormenta del Viernes día 28/04/12.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    120,
    '25730',
    '2012-05-31',
    'Se fondea de nuevo pintada con paneles nuevos y tres baterías nuevas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    121,
    '25730',
    '2016-06-06',
    'Se sustituye la puerta del armario exterior y la fotocélula nº2.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    122,
    '25730',
    '2016-07-26',
    'Avería por batería baja. Se revisa la instalación y se deja operativa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    123,
    '25730',
    '2017-01-31',
    'Se saca a tierra por mantenimiento (eléctrico ,mecánico y pintura)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    124,
    '25730',
    '2017-07-05',
    'Una vez finalizado su mantenimiento se fondea de nuevo en su ubicación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    125,
    '25730',
    '2017-07-10',
    'Se suelta de su anclaje el PLC dando fallo, se sujeta con bridas. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    126,
    '25740',
    '2004-04-16',
    'Se instala el tele-control y se sustituye la linterna de Balizamar por una BDL 120 de ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    127,
    '25740',
    '2006-05-12',
    'Siniestro de la boya por temporal se recupera en la playa de Pinedo y se fondea una sustituta con las mismas características en su lugar el día 21/06/06.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    128,
    '25740',
    '2007-06-12',
    'Se sustituye la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    129,
    '25740',
    '2008-09-23',
    'Sustituir tres baterías por avería, dañadas por temporal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    130,
    '25740',
    '2008-12-10',
    'Sustituir linterna por condensación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    131,
    '25740',
    '2009-10-05',
    'Sustituir PLC por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    132,
    '25740',
    '2009-12-14',
    'Sustituir boya por mantenimiento. Instalación del telecontrol en boya sustituta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    133,
    '25740',
    '2010-01-15',
    'Sustituir la marca de tope.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    134,
    '25740',
    '2010-01-28',
    'Emplazar Moscad, que se había soltado y daba fallos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    135,
    '25740',
    '2011-04-08',
    'Sustituir boya por mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    136,
    '25740',
    '2012-03-14',
    'Repara fallo periódico de comunicaciones con GPS. ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    137,
    '25740',
    '2013-07-08',
    'Sustituir baterías del año 2005.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    138,
    '25740',
    '2016-10-24',
    'Se saca a tierra por mantenimiento (batería baja)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    139,
    '25740',
    '2016-12-13',
    'Se fondea de nuevo la boya y se retira la provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    140,
    '25740',
    '2017-03-08',
    'Volvemos a sacar la boya para reparar los paneles solares (temporal)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    141,
    '25740',
    '2017-05-18',
    'Se fondea de nuevo una vez reparada y se retira la provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    142,
    '25740',
    '2019-04-22',
    'Varada en playa del Saler debido a fuerte temporal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    143,
    '25740',
    '2019-04-30',
    'Se fondea la boya de sustitución (adjunta en fotos)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    144,
    '25740',
    '2019-06-05',
    'Se recupera la boya varada en la playa de pinedo'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    145,
    '25761',
    '2004-04-16',
    'Se instala tele-control y se sustituye linterna de Balizamar  por BDL 120 de ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    146,
    '25761',
    '2008-11-21',
    'Se sustituye la boya por una provisional por labores de mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    147,
    '25761',
    '2012-10-05',
    'Se sustituye la boya por que se detecta en la revisión periódica que no tiene paneles solares, se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    148,
    '25761',
    '2013-02-15',
    'Una vez reparada se repone de nuevo y se retira la provisional (baterías nuevas y paneles nuevos)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    149,
    '25761',
    '2013-03-12',
    'Se sincroniza con la boya 25765. (ANFER)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    150,
    '25761',
    '2014-05-06',
    'Sustituida foto-célula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    151,
    '25761',
    '2014-08-05',
    'Fallo de sincronia con la 25765. Se repara reseteando la RTU.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    152,
    '25761',
    '2014-09-07',
    'Falla una fotocélula dejando encendida la boya'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    153,
    '25761',
    '2014-09-08',
    'Se sutituye la fotocelula nº1 y se verifica funcionamiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    154,
    '25761',
    '2014-10-02',
    'Se sustituye el PLC (ANFER) por que los problemas de LDR persistian. OK'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    155,
    '25761',
    '2015-11-09',
    'Se sustituye la boya metálica por una EMB 2.2 reformada. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    156,
    '25761',
    '2018-01-30',
    'Se sustituye la foto-célula izquierda.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    157,
    '25765',
    '2004-04-16',
    'Se instala tele-control y se sustituye linterna de Balizamar por BDL 120 de ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    158,
    '25765',
    '2008-06-09',
    'Se sustituye por una provisional por labores de mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    159,
    '25765',
    '2010-10-21',
    'Se instalan nuevas baterías por averia.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    160,
    '25765',
    '2012-02-27',
    'Fallos de comunicaciones por exceso de transmisiones. ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    161,
    '25765',
    '2012-09-14',
    'Se recorta el radio de borneo de la boya acortando la cadena 5m.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    162,
    '25765',
    '2013-03-12',
    'Se sincroniza con la boya 25761. (ANFER)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    163,
    '25765',
    '2014-09-03',
    'Se recupera la marca de tope del fondo marino, rota por la base y se instala de nuevo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    164,
    '25765',
    '2014-09-05',
    'Fallo de sincronia con la 25761. Se repara reseteando la RTU.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    165,
    '25765',
    '2015-10-08',
    'Se sustituye la boya metálica por una EMB 2.2 reformada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    166,
    '25768',
    '2009-11-20',
    'Se fondea nueva boya de bifurcación por disminución de calado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    167,
    '25768',
    '2010-04-26',
    'Se sustituye la boya (foto).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    168,
    '25768',
    '2015-10-30',
    'Se sustituye el tren de fondeo completo por desgaste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    169,
    '25768',
    '2018-02-06',
    'Se saca a tierra por mantenimiento. Se le cambia la batería a la baliza 6v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    170,
    '25768',
    '2018-02-27',
    'Se fondea de nuevo en su posición, limpia y pintada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    171,
    '25774',
    '2007-01-15',
    'El taller repara la puerta de acceso a la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    172,
    '25774',
    '2007-10-14',
    'Avería por fallo de red220v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    173,
    '25774',
    '2008-02-21',
    'Pintado de la torre Rojo-blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    174,
    '25774',
    '2009-02-15',
    'Instalación de una baliza lineal MLP 3000 (Mesemar).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    175,
    '25774',
    '2010-09-15',
    'Se incorpora al tele-control la baliza lineal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    176,
    '25774',
    '2012-11-22',
    'Se monta panel para crear un sector de oscuridad  270º  a  325º (55º)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    177,
    '25774',
    '2013-11-05',
    'Se reinstala el cuadro de acometida y se añade punto de luz'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    178,
    '25774',
    '2014-01-16',
    'Se repara linterna vertical (MSM) sustituye el destellador y lo saca fuera.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    179,
    '25774',
    '2014-01-17',
    'Se repara y se repinta la torre por Dragados'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    180,
    '25774',
    '2014-11-24',
    ' Se sincroniza el lite-pipe con la linterna principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    181,
    '25774',
    '2015-09-23',
    'Se sustituyen ambas LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    182,
    '25774',
    '2017-12-13',
    'Repintado de la torre manteniendo la base blanca.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    183,
    '25777',
    '2010-01-20',
    'Se instala la nueva torre TPS 3.3 (LMV)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    184,
    '25777',
    '2011-03-09',
    'Se instala telecontrol y se sincroniza con 25776.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    185,
    '25777',
    '2011-05-31',
    'Avería en la fuente de alimentación ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    186,
    '25777',
    '2012-01-17',
    'Avería por tormenta de la fuente de alimentación ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    187,
    '25777',
    '2012-11-18',
    'Avería por tormenta de la fuente de alimentación ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    188,
    '25777',
    '2012-11-21',
    'ANFER sustituye la fuente y conecta la carga directamente a la batería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    189,
    '25777',
    '2013-05-14',
    'Avería en la fuente, se sustituye y se manda a reparar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    190,
    '25777',
    '2013-05-17',
    'Avería en la fuente, se retira se manda a repara y se instala un cargador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    191,
    '25777',
    '2013-11-20',
    'Se reinicia por fallo de comunicación y se restablece el servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    192,
    '25777',
    '2015-04-08',
    'Se repinta la torre de la baliza dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    193,
    '25777',
    '2015-09-24',
    'Se sustituyen ambas LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (194, '25777', '2017-12-12', 'Se repinta la torre');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    195,
    '25777',
    '2019-04-24',
    'Se sustituye la bateria y la fuente de alimentación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (196, '25800', '2004-11-04', 'Se pinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    197,
    '25800',
    '2007-10-22',
    'Se instala nueva torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    198,
    '25800',
    '2007-10-24',
    'Anfer instala el telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    199,
    '25800',
    '2007-12-13',
    'Avería por caída del magneto-térmico de acometida.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (200, '25800', '2009-02-27', 'Pintar torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    201,
    '25800',
    '2010-09-27',
    'Se pinta la torre. (El carbón de la zona obliga a una mayor atención)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    202,
    '25800',
    '2012-04-02',
    ' Se cambia la característ. pasa de CtR a DR. y se comunica oficialmente.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    203,
    '25800',
    '2012-04-02',
    'Se cambia la característica que pasa de Ct. a DV 3 segundos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    204,
    '25800',
    '2012-05-11',
    ' Magneto-térmico de acomet. averiado por filtración de agua, se sustituye.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    205,
    '25800',
    '2013-11-06',
    'Se sustituye cuadro de acometida y se instala pantalla de fluorescentes.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    206,
    '25800',
    '2015-05-07',
    'Se repinta toda la señal, dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    207,
    '25800',
    '2015-11-17',
    'Se sustituyen los cierres y el candado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    208,
    '25800',
    '2016-02-25',
    'Se sustituye la batería por una usada del 2011 (en buenas condiciones)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    209,
    '25800',
    '2016-04-05',
    'Se sustituyen ambas LDR por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    210,
    '25800',
    '2017-09-05',
    'Se pinta toda la señal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    211,
    '25800',
    '2017-10-31',
    'Se sustituye por rotura, la óptica de la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    212,
    '25800',
    '2018-01-11',
    'Se sustituye el Moscad para restablecer el Tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    213,
    '25820',
    '2004-06-25',
    'Se sustituye baliza modelo  Balizamar por BDL 120 ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (214, '25820', '2004-11-04', 'Se pinta la torre. ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    215,
    '25820',
    '2007-01-26',
    'Apagada y retirada por obras. Se fondea una boya en su lugar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    216,
    '25820',
    '2009-05-15',
    'Se instala nueva torre TPS 3.3 (LMV)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    217,
    '25820',
    '2009-09-09',
    'Se sincroniza con la boya 25820.1'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    218,
    '25820',
    '2011-03-31',
    'Avería, fallo de la linterna y del sincronismo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    219,
    '25820',
    '2011-05-16',
    'Se instala el Tele-control (ANFER).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    220,
    '25820',
    '2011-06-13',
    'Sincronizar a través del tele-control con la boya 25820.1'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    221,
    '25820',
    '2013-11-07',
    'Instalación de un punto de luz.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    222,
    '25820',
    '2017-09-05',
    'Se pinta toda la señal con el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    223,
    '25820.1',
    '2007-01-26',
    'Se fondea de modo provisional por apagado y retirado de la baliza 25.820'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    224,
    '25820.1',
    '2007-03-15',
    'Se desplaza por dragado en la zona.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    225,
    '25820.1',
    '2009-09-09',
    'Se sincroniza con la 25820 LMV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    226,
    '25820.1',
    '2010-08-26',
    'Se sustituye la boya por una nueva tele-controlada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    227,
    '25820.1',
    '2011-06-13',
    'Se sincroniza con la baliza 25820 a través del tele- control, ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    228,
    '25820.1',
    '2011-07-25',
    'Repara fallo de comunicaciones.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    229,
    '25820.1',
    '2011-11-24',
    'Fallo en el destellador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    230,
    '25820.1',
    '2013-03-21',
    'Sustitución de una fotocélula.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    231,
    '25820.1',
    '2018-01-15',
    'Los topográfos toman nueva posición.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (232, '25830', '2004-11-04', 'Se pinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    233,
    '25830',
    '2010-08-26',
    'Se retira la boya de obras 25830.1 fondeada durante la ejecución de las obras.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    234,
    '25830',
    '2010-10-01',
    'Se instala nueva torre TPS 4.3 y se monta el telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    235,
    '25830',
    '2011-08-25',
    'Se sustituyen las dos LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    236,
    '25830',
    '2013-11-22',
    'Anfer repara radio (Etapa de potencia averiada).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    237,
    '25830',
    '2015-04-01',
    'se sustituye la LDR nº 1'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    238,
    '25830',
    '2016-11-08',
    'Se pinta la torre verde con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    239,
    '25830',
    '2018-05-11',
    'Se sustituye una fotocélula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    240,
    '25830',
    '2019-05-30',
    'Se sustituye fotocélula por avería'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    241,
    '25831',
    '2019-01-18',
    'Se sustituye el poste acorde a normativa'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    242,
    '25840',
    '2004-06-16',
    'Se sustituye linterna Balizamar por BDL 120 de ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    243,
    '25840',
    '2007-01-31',
    'Se apaga y se retira por obras. Se fondea una boya en su lugar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    244,
    '25840',
    '2007-03-15',
    'Se desplaza la boya provisional por dragado'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    245,
    '25840',
    '2009-04-08',
    'Se instala nueva torre TPS 3.3 (LMV).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    246,
    '25840',
    '2009-10-27',
    'Se repinta para adecuarse a la nueva resolución, toda roja y se modifican los destellos a GpD (4) R.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    247,
    '25840',
    '2010-03-16',
    'Se instala el tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    248,
    '25840',
    '2011-06-16',
    'Se instala sincronismo con la boya 25840.1 (no está fondeada todavía).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    249,
    '25840',
    '2012-06-08',
    'Se sustituyen las LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    250,
    '25840',
    '2012-12-04',
    'Se desmonta la linterna para reparar fallos en coronas de leds.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    251,
    '25840',
    '2013-11-04',
    'Se instala punto de luz.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    252,
    '25840',
    '2015-06-04',
    'Se repinta toda la señal, dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    253,
    '25840',
    '2018-10-01',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    254,
    '25841',
    '2013-02-19',
    'Se fondea y entra en servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    255,
    '25841',
    '2014-12-01',
    'Se monitoriza, se detectan errores y se informa de ellos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    256,
    '25841',
    '2014-12-16',
    'Finalizan trabajos de tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    257,
    '25841',
    '2015-01-05',
    'Se sustituyen las dos baterías.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    258,
    '25841',
    '2015-10-30',
    'Se reponen ánodos de sacrificio, por desgaste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    259,
    '25841',
    '2015-12-21',
    'Se sustituye la fotocélula nº2 y se secan humedades en la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    260,
    '25841',
    '2016-05-16',
    'Se vuelve a abrir para secar la humedad de la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    261,
    '25841',
    '2017-09-21',
    'Se desmonta la linterna para eliminar la humedad.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    262,
    '25841',
    '2018-01-16',
    'Se desplaza a nueva posición.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    263,
    '25841',
    '2018-03-21',
    'Se sustituye por una provisional por mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    264,
    '25841',
    '2018-04-04',
    'Se posiciona de nuevo en su ubicación, sustituida linterna (BDL 120).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    265,
    '25842.5',
    '2016-04-08',
    'La boya se suelta de su fondeo habitual  y hay volver a fondearla.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    266,
    '25842.5',
    '2017-03-01',
    'Se fondea una nueva boya luminosa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (267, '25842.5', '2019-04-15', 'Cambio de linterna');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    268,
    '25842.5',
    '2019-04-15',
    'Se sustituye la linterna por una MCL 160 con 5% de divergencia'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    269,
    '25843',
    '2014-01-20',
    'Se repinta toda la torre de blanco y rojo.(DRAGADOS)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    270,
    '25843',
    '2017-03-01',
    'Se sustituye la baliza por una boya y se sincroniza con la 25842.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    271,
    '25843',
    '2017-10-11',
    'Se sustituye la boya por una nueva, modelo PBM 18'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    272,
    '25843.5',
    '2017-03-01',
    'Se sustituye por una boya luminosa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    273,
    '25843.8',
    '2017-03-01',
    'Se fondea por primera vez.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    274,
    '25844',
    '2009-06-05',
    'Se fondea boya oceanográfica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    275,
    '25844',
    '2009-06-10',
    'Se desplaza  para que no moleste a la navegación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    276,
    '25844',
    '2009-12-17',
    'Se procede a retirar la boya por labores de mantenimiento. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    277,
    '25844',
    '2010-11-26',
    'Se procede a retirar boya por mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    278,
    '25844',
    '2011-05-09',
    'Se sustituye boya por provisional por labores de mantenimiento (fallos en los sensores).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    279,
    '25844',
    '2011-11-04',
    'Baja de la marca por linterna apagada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    280,
    '25844',
    '2011-11-11',
    'Se sustituye la linterna por una auto-alimentada MCL140, por fallo baterías.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    281,
    '25844',
    '2013-01-28',
    'Sustitución de las dos baterías (Marca Ritar 250 Ah.)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    282,
    '25844',
    '2013-06-14',
    'Se saca del agua por decisión tecnica y se comunica su retirada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    283,
    '25844',
    '2013-10-30',
    'SUPRIMIDA DEFINITIVAMENTE'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    284,
    '25920',
    '2007-06-17',
    'Se instala nueva baliza.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    285,
    '25920',
    '2008-11-29',
    'Sustituyo la batería por una nueva de gel 100 A/h.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    286,
    '25920',
    '2008-12-03',
    'Reparar linterna, numerosos leds fundidos (dos coronas).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    287,
    '25920',
    '2010-06-24',
    'Se instala telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    288,
    '25920',
    '2010-06-30',
    'Se sustituyen las foto-células'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (289, '25920', '2011-12-29', 'Sustituir linterna .');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (290, '25920', '2012-07-12', 'Sustituir batería.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    291,
    '25920',
    '2013-11-04',
    'Se instala pantalla de fluorescentes.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    292,
    '25920',
    '2015-06-24',
    'Se repinta la baliza y se deja el tercio inferior blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (293, '25920', '2018-10-23', 'Se repinta la baliza.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    294,
    '25940',
    '2007-10-17',
    'Se instala torre nueva.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    295,
    '25940',
    '2007-10-29',
    'Anfer instala telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    296,
    '25940',
    '2008-11-29',
    'Sustituyo la batería por una nueva de gel 100 A/h.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    297,
    '25940',
    '2010-03-01',
    'Se instala el tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (298, '25940', '2010-11-19', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    299,
    '25940',
    '2012-07-19',
    'Datos de la tensión de baterías erróneos. Anfer repara.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    300,
    '25940',
    '2013-11-04',
    'Se instala pantalla de fluorescentes.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    301,
    '25940',
    '2014-10-01',
    'Se sustituye la batería por una en buen estado (no nueva).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    302,
    '25940',
    '2016-05-16',
    'Una estacha revienta la torre de la baliza. Se encarga una defensa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    303,
    '25940',
    '2016-06-09',
    'El taller instala una defensa para evitar daños por las estachas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    304,
    '25940',
    '2016-09-27',
    'Sustitución de la LDR nº 2 por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    305,
    '25940',
    '2017-12-19',
    'Sustitución de las dos LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (306, '25940', '2018-10-23', 'Se repinta la baliza.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    307,
    '26020',
    '2009-10-19',
    'Se instala nueva baliza cardinal sur. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    308,
    '26020',
    '2010-11-12',
    'Se sustituyen los discos de leds averiados.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    309,
    '26020',
    '2010-12-17',
    'Se sustituye la linterna por una de bajo consumo (led de alta visibilidad)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    310,
    '26020',
    '2013-06-11',
    'Se modifica la marca de tope y se baja el panel solar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    311,
    '26020',
    '2015-06-11',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    312,
    '26020',
    '2018-02-12',
    'Se rompe el soporte de la marca de tope (aviso al taller mecánico).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    313,
    '26020',
    '2018-02-16',
    'Se instala de nuevo la marca de tope reparada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    314,
    '26020',
    '2018-08-29',
    'Se apaga la luz y se repara sustituyendo la batería y el regulador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (315, '26020', '2018-10-18', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    316,
    '26021',
    '2006-09-04',
    'Se retira la torre cuadrangular por obras de ampliación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    317,
    '26021',
    '2006-11-08',
    'Se instala baliza de manera provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (318, '26021', '2009-06-27', 'Se pinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    319,
    '26021',
    '2009-10-30',
    'Se instala nueva torre TPS 3.3.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    320,
    '26021',
    '2015-06-11',
    'Se repinta la torre verde con la base blanca'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    321,
    '26025',
    '2009-01-09',
    'Se instala nueva torre TPS 3.3 y se retira la boya que se fondeó por obras.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    322,
    '26025',
    '2009-03-04',
    'Se instala escalera de acero inox. Para mejorar acceso.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    323,
    '26025',
    '2015-06-11',
    'Se repinta la torre roja con la base blanca'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (324, '26025', '2018-10-18', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    325,
    '26035',
    '2012-10-18',
    'Sustituir destellador y reprogramar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    326,
    '26035',
    '2016-04-13',
    'Se pinta manteniendo el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (327, '26035', '2018-10-18', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (328, '26041', '2009-06-27', 'Pintado de la torre');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    329,
    '26041',
    '2012-02-02',
    'Cambio de óptica por degradación. O.T. 55/242/2012'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    330,
    '26041',
    '2016-04-13',
    'Se pinta manteniendo el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (331, '26041', '2018-10-18', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    332,
    '26045',
    '2008-06-25',
    'Sustitución de la batería de gel de 100 A/h.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    333,
    '26045',
    '2010-01-07',
    'Sustitución de la batería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    334,
    '26045',
    '2013-12-13',
    'Sustitución del panel solar por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    335,
    '26045',
    '2013-12-20',
    'Sustitución de las baterías (Usadas).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    336,
    '26045',
    '2014-01-07',
    'Se comienza su repintado y con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    337,
    '26045',
    '2014-05-21',
    'Se sustituye la bateria y se instala una RITAR 140 Ah'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    338,
    '26046',
    '2001-01-07',
    ' Se comienza su repintado con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    339,
    '26046',
    '2010-01-25',
    'Sustitución de la batería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    340,
    '26046',
    '2012-09-13',
    'Sustitución de la fotocélula por rotura.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    341,
    '26046',
    '2014-04-07',
    'Se sustituye el panel solar, la batería (RITAR 140 Ah) y el regulador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    342,
    '26046',
    '2018-11-28',
    'Se sustitulle la fotocélula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    343,
    '26047',
    '2014-01-21',
    'Dragados repinta y dejan el tercio inferior de Blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    344,
    '26047',
    '2014-06-17',
    'El S. Electrico instala alumbrado interior a 12 v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    345,
    '26047',
    '2014-11-05',
    'Anfer comienza trabajos de instalación del tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    346,
    '26047',
    '2014-12-12',
    'Se ponen en paralelo  las dos baterias. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    347,
    '26047',
    '2014-12-15',
    'Se por finalizados los trabajos de telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    348,
    '26047',
    '2015-09-08',
    'Se sustituye la fotocélula nº 2'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    349,
    '26047',
    '2017-12-18',
    'Se pinta la torre manteniendo el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    350,
    '26047.1',
    '2014-06-18',
    'El S. Electrico instala alumbrado interior a 12 v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    351,
    '26047.1',
    '2015-06-24',
    'Se apaga definitivamente por la entrada en servicio del nuevo faro. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    352,
    '26047.2',
    '2013-09-01',
    'sustituimos la linterna BDL 120 por avería de multiples leds.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    353,
    '26047.2',
    '2014-06-19',
    'El S. Electrico instala alumbrado interior a 12 v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    354,
    '26047.2',
    '2014-11-04',
    'ANFER instala el tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    355,
    '26047.2',
    '2014-11-16',
    'Se dan por finalizados los trabajos del tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    356,
    '26047.2',
    '2014-11-18',
    'Comienza a trabajar con el telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    357,
    '26047.2',
    '2017-03-02',
    'Se sustituye una foto-célula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    358,
    '26047.2',
    '2018-10-16',
    'Se limpia y se revisan trampas para roedores.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    359,
    '26047.2',
    '2018-11-06',
    'Se repinta toda la señal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    360,
    '26048',
    '2014-04-09',
    'Se repara la instalación electrica por fallos de conexión.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    361,
    '26048',
    '2014-06-23',
    'El S. Electrico instala alumbrado interior a 12 v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    362,
    '26048',
    '2014-11-10',
    'Anfer comienza a instalar el telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    363,
    '26048',
    '2014-11-20',
    'Comienza atrabajar con el tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    364,
    '26048',
    '2014-12-16',
    'Se dan por finalizados los trabajos de telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    365,
    '26048',
    '2016-10-27',
    'Se pinta con el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    366,
    '26048.1',
    '2013-09-18',
    'Se sustituye el Des-33 y la fotocélula por avería por tormenta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    367,
    '26048.1',
    '2013-11-12',
    'Se sustituye el Des-33 y se pone un Des-22 por tormenta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    368,
    '26048.1',
    '2014-06-25',
    'El S.E. Instala alumbrado interior a 12 V.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    369,
    '26048.1',
    '2014-11-11',
    'Anfer comienza la instalación del telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    370,
    '26048.1',
    '2014-11-18',
    'Comienza a trabajar con el tele control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    371,
    '26048.1',
    '2014-12-16',
    'e dan por finalizados los trabajos del telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    372,
    '26048.1',
    '2015-06-29',
    'La baliza no comunica, posible fallo de la radio, se avisa a Integración de sistemas para que avisen a ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    373,
    '26048.1',
    '2015-07-15',
    'Se repara la radio GP320 y queda operativa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    374,
    '26048.1',
    '2016-10-27',
    'Se pinta con el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    375,
    '26048.1',
    '2018-01-08',
    'Fallo de comunicaciones por tormenta. Se resetea PLC.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    376,
    '26048.2',
    '2014-11-18',
    'Anfer sincroniza la boya con la 26048.3'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    377,
    '26048.2',
    '2016-03-31',
    'Se saca del agua para reparar la estructura y mantenimiento general.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    378,
    '26048.2',
    '2016-06-01',
    'Se vuelve a fondear en su ubicación, se le ha instalado un cable en la barandilla, para evitar que se posen pájaros.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    379,
    '26048.2',
    '2017-09-21',
    'Se sustituye una LDR por mal estado del encapsulado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    380,
    '26048.3',
    '2014-11-18',
    'Anfer sincroniza la boya con la 26048,2'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    381,
    '26048.3',
    '2016-07-19',
    'Se saca la boya a tierra por mantenimiento general y pintura. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    382,
    '26048.3',
    '2016-10-11',
    'Anfer sustituye el transceptor y una LDR tras la revisión.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    383,
    '26048.3',
    '2016-10-19',
    'Se sustituyen las dos baterías por unas nuevas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    384,
    '26048.3',
    '2016-10-24',
    'Se fondea de nuevo en su posición.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    385,
    '26048.3',
    '2016-12-12',
    'Se sustituye una LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    386,
    '26048.3',
    '2017-06-06',
    'La boya se ha apagado. Se repara el regulador y queda en servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    387,
    '26048.3',
    '2017-06-16',
    'Hemos tenido que sustituir el regulador por otro. No permitia la carga de la Bat.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    388,
    '26050',
    '2014-11-07',
    'Se da de baja por falo de suministro (Batería en mal estado).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (389, '26050', '2014-11-12', 'Se da de alta.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    390,
    '26060',
    '2017-09-21',
    'Se da de baja, fallo de la linterna, ritmo inadecuado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    391,
    '26190',
    '2013-01-09',
    ' Sustitución LDR en BDL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    392,
    '26190',
    '2013-10-04',
    ' Se sustituye boya completa por mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    393,
    '26190',
    '2015-04-22',
    ' Averia por vandalismo, luz apagada. Instalación eléctrica arrancada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    394,
    '26190',
    '2015-05-08',
    'Se sustituye la boya por una nueva de espeque y antivandálica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    395,
    '26190',
    '2015-12-05',
    'Se sustituye el muerto y se traslada a una nueva posición.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    396,
    '26190',
    '2019-04-21',
    'Varada en playa norte Port Saplaya debido a fuerte temporal (Baja)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    397,
    '26190',
    '2019-05-06',
    'Se recupera y se traslada a la base para su reparación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    398,
    '26190',
    '2019-05-10',
    'Se fondea de nuevo en su ubicación (Alta).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    399,
    '26270',
    '2010-02-11',
    'Sustitución de los 4 paneles, la LDR y el destellador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    400,
    '26270',
    '2012-09-06',
    'Sustitución del grillete y poner varios discos en la cola'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    401,
    '26270',
    '2013-01-09',
    'Sustitución LDR en BDL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    402,
    '26270',
    '2013-11-13',
    'Sustitución por Boyarín Provisional, con Linterna Autoalimentada'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    403,
    '26270',
    '2013-12-16',
    'Sustitución por Boya, con Linterna Autoalimentada'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    404,
    '26270',
    '2014-02-10',
    'Pasa a pertenecer al CCC de Gas Natural-Fenosa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    405,
    '26285',
    '2012-01-23',
    'Linterna Inferior, falla 1/4 Piña Leds, en alineación Dique.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    406,
    '26285',
    '2012-08-10',
    'Sustitución de la fotocélula y la tarjeta destelladora  del litepipe derecho.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    407,
    '26285',
    '2013-04-09',
    'Sustitución 2 LDRs, Telecontrol Linternas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    408,
    '26285',
    '2013-10-15',
    'Sustituir baterías de los litepipes, 180 Ah (2 de 12 V) por 200 Ah (6 V + 6V).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    409,
    '26285',
    '2014-03-06',
    'Dejar Fuera de Servicio, Linterna Inferior.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    410,
    '26285',
    '2014-03-21',
    'Retirar Linterna Inferior.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    411,
    '26285',
    '2014-10-15',
    'AIS, el identificador pasa a comenzar por 99, antes 00.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    412,
    '26285',
    '2014-11-25',
    'Lite-Pipes sincronizados con la Linterna. Toda la Baliza se alimenta con 330 Ah (6 V + 6 V).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (413, '26285', '2015-09-09', 'Cambiar LDR01.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    414,
    '26285',
    '2016-12-27',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    415,
    '26290',
    '2005-04-12',
    'Sustitución destellador'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (416, '26290', '2005-11-03', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (417, '26290', '2007-08-30', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (418, '26290', '2009-11-27', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    419,
    '26290',
    '2011-10-21',
    'Sustitución fotocélula'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (420, '26290', '2012-08-08', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    421,
    '26290',
    '2013-04-10',
    'Mejora electrificación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (422, '26290', '2014-10-23', 'Sustitución de LDR 01');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    423,
    '26290',
    '2015-09-04',
    'Modificación según Resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (424, '26290', '2015-09-18', 'Pintada');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (425, '26290', '2016-04-26', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (426, '26311', '2009-11-17', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (427, '26311', '2011-08-23', 'Sustitución cargador');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    428,
    '26311',
    '2013-04-11',
    'Mejora electrificación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    429,
    '26311',
    '2015-09-04',
    'Modificación según resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (430, '26311', '2015-09-14', 'Pintada');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (431, '26311', '2015-10-22', 'Sustituir LDR 01.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    432,
    '26311',
    '2016-05-04',
    'Sustituir batería, por otra usada, pero en mejor estado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    433,
    '26312',
    '2006-09-25',
    'Sustitución destellador'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (434, '26312', '2009-11-17', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (435, '26312', '2013-01-29', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    436,
    '26312',
    '2013-04-11',
    'Mejora electrificación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    437,
    '26312',
    '2014-01-28',
    'Pintura nueva, con franja inferior 1/3 Blanca.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    438,
    '26312',
    '2016-05-04',
    'Sustituir batería de 90 Ah, por otra usada, de 100 Ah. pero en mejor estado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    439,
    '26312',
    '2017-05-24',
    'Sustituir LDR nº1 averiada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (440, '26313', '2010-01-11', 'Sustitución baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (441, '26313', '2010-11-03', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (442, '26313', '2012-12-11', 'Sustitución baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    443,
    '26313',
    '2012-12-17',
    'Sustitución LDR baliza BDL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    444,
    '26313',
    '2013-01-09',
    'Sustitución LDR Telecontrol'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    445,
    '26313',
    '2014-01-30',
    'Cambio de Regulador de Carga, STECA SOLARIX PRS 2020.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    446,
    '26313',
    '2014-02-05',
    'Cambio de Linterna (BDL-120, al 25%, y DES-33)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    447,
    '26313',
    '2014-09-24',
    'Falla LDR 01, pendiente de sustitución (por malas condiciones).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (448, '26313', '2014-11-26', 'Sustituir LDR 01.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    449,
    '26313',
    '2015-06-18',
    'Sustituir Boya por Móbilis Amarilla.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    450,
    '26313',
    '2015-06-23',
    'Sustituir 8 PFV de 10 W, por 2 PFV de 95 W.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    451,
    '26313',
    '2015-08-06',
    'Sustituir Móbilis Amarilla por Boya.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    452,
    '26313',
    '2016-08-09',
    'Se sustituye el tren de fondeo, 28 m. cadena galvanizada de 30 mm.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    453,
    '26313',
    '2017-12-14',
    'Se observa que los paneles FV están muy sucios por gaviotas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    454,
    '26313',
    '2018-03-08',
    'Se sustituye la boya  por Mobilis amarilla para mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    455,
    '26313',
    '2018-04-12',
    'Se repone: antena GPS, fotocélula y óptica. Se pinta y se fondea de nuevo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    456,
    '26313',
    '2018-10-04',
    'Se desconecta el tele-control para ahorar batería. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (457, '26314', '2006-02-07', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (458, '26314', '2009-11-17', ' Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    459,
    '26314',
    '2012-10-01',
    'Linterna provisional por caida de poste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    460,
    '26314',
    '2013-01-11',
    'Mejora Electrificación, Acometida NO INDEPENDIENTE'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    461,
    '26314',
    '2013-05-09',
    'F.A. sin Control de Temperatura y un solo módulo (de 200 W)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (462, '26314', '2014-01-14', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    463,
    '26314',
    '2014-01-21',
    'Magneto 10 A saltado, anular ventilador F.A.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    464,
    '26314',
    '2014-01-31',
    'Reponer ventilador F.A.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    465,
    '26314',
    '2014-03-12',
    'Nivelar parte inferior Baliza.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (466, '26314', '2015-10-22', 'Sustituir LDR 01');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    467,
    '26314',
    '2016-12-27',
    'Se repinta la torre con el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    468,
    '26314',
    '2018-08-03',
    'Se sustituye la LDR nº2 por deterioro de la misma.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    469,
    '26320',
    '2005-11-05',
    'Sustitución panel  roto'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    470,
    '26320',
    '2009-09-10',
    'Sustitución panel  roto'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (471, '26320', '2009-10-15', 'Sustucion baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    472,
    '26320',
    '2013-05-10',
    'Entrada de agua en la caja Himel exterior, detector de intrusión corroído y  tapa de baterias en mal estado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    473,
    '26320',
    '2013-12-16',
    'Resetear por fallo de GPS y anular detector de intrusión.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    474,
    '26320',
    '2014-01-30',
    'Se sustituye por la Móbilis. En la Revisión en tierra se sustituyen, BATs, óptica y Regulador FV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    475,
    '26320',
    '2014-03-13',
    'Vuelve otra vez, al agua.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    476,
    '26320',
    '2014-09-24',
    'Falla LDR 02, pendiente de sustitución (por malas condiciones).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (477, '26320', '2014-11-26', 'Sustituir LDR 02.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    478,
    '26320',
    '2015-09-04',
    'Modificación según Resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    479,
    '26320',
    '2017-09-14',
    'Óptica en mal estado pendiente de cambio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    480,
    '26320',
    '2019-02-12',
    'Se observa la marca de tope doblada y la barandilla con sintomas de haber recibido un impacto.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (481, '26325', '2010-01-08', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (482, '26325', '2010-02-16', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    483,
    '26325',
    '2012-04-02',
    'Sustitución cierres Baliza'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (484, '26325', '2015-02-04', 'Sustitución LDR nº 2.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (485, '26325', '2015-09-16', 'Pintada');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    486,
    '26325',
    '2016-05-04',
    'Sustituir batería, por otra usada, pero en mejor estado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (487, '26325', '2017-04-11', 'Sustituir LDR nº 1.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    488,
    '26325',
    '2017-07-13',
    'Se  repara la acometida electrica por un fallo de conexión.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    489,
    '26326',
    '2014-02-14',
    'Se sustituye el poste, por la Baliza.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    490,
    '26326',
    '2014-12-16',
    'Se dan por finalizados los trabajos del tele-control. (ANFER)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (491, '26360', '2012-04-17', 'Sustitución óptica ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (492, '26360', '2013-01-09', 'Sustitución  baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    493,
    '26360',
    '2013-02-05',
    'Anular Telecontrol, alimentación exterior linterna (Baja 04/02 y Alta 05/02)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    494,
    '26360',
    '2013-03-06',
    'Sustitución por la Móbilis, para su revisión en Tierra'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    495,
    '26360',
    '2013-03-21',
    'Sustitución regulador BP 20 Amp por STECA 20 Amp'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    496,
    '26360',
    '2013-03-22',
    'Según test solicitado, no funciona como autónoma'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    497,
    '26360',
    '2013-05-10',
    'Puesta, otra vez, en el agua'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    498,
    '26360',
    '2014-06-19',
    'Colisionada por un pesquero.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    499,
    '26360',
    '2014-06-20',
    'Sustituida por la Móbilis. Se repara estructuralmente, se pinta y se sustituye un PFV Atersa A-38 (38 W).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    500,
    '26360',
    '2014-07-15',
    'Vuelve otra vez, al agua.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    501,
    '26360',
    '2015-09-04',
    'Modificación según Resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    502,
    '26360',
    '2016-08-09',
    'Se sustituye el tren de fondeo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    503,
    '26360',
    '2016-12-01',
    'Por la noche ha permanecido apagada, se revisa y se deja en servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    504,
    '26360',
    '2016-12-05',
    'Se ha vuelto a apagar por batería baja, se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    505,
    '26360',
    '2016-12-07',
    'Se recupera la batería y se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    506,
    '26360',
    '2016-12-20',
    'Se apaga de madrugada y se recupera a las 18h. (baja y alta mismo día) '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    507,
    '26360',
    '2017-09-14',
    'Panel foto voltaico averiado pendiente de sustitución.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    508,
    '26360',
    '2018-08-18',
    'Se da de baja por que está apagada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    509,
    '26360',
    '2018-08-20',
    'Se sustituye el regulador y una batería. Se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    510,
    '26360',
    '2018-09-08',
    'Se da de baja porque se vuelve a apagar. Preparamos sustituta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    511,
    '26360',
    '2018-09-13',
    'Se sustituye la boya por la Mobilis para su reparación y revisión. Alta'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    512,
    '26360',
    '2019-02-12',
    'En el Martillo dique Levante. Burriel la pinta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    513,
    '26360',
    '2019-02-12',
    'Se conecta el telecontrol, bajo observación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (514, '26380', '2006-02-14', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (515, '26380', '2008-01-11', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    516,
    '26380',
    '2008-11-20',
    'Sustitución LDR en BDL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    517,
    '26380',
    '2012-04-02',
    'Sustitución cierres baliza'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    518,
    '26380',
    '2015-09-04',
    'Modificación según resolución.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (519, '26380', '2015-09-16', 'Pintada');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (520, '26390', '2007-08-30', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    521,
    '26390',
    '2009-11-03',
    'Sustitución óptica y LDR'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    522,
    '26390',
    '2011-01-19',
    'Sustitución linterna (completa).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    523,
    '26390',
    '2015-09-04',
    'Modificación según Resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    524,
    '26390',
    '2016-12-02',
    'Se pinta con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    525,
    '26392',
    '2008-11-18',
    'Sustitución  LDR y óptica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    526,
    '26392',
    '2011-11-23',
    'ustitución  LDR y óptica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (527, '26392', '2012-04-06', 'Sustitución F.A.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (528, '26392', '2012-05-21', 'Sustitución F.A.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (529, '26392', '2013-02-01', 'Sustitución F.A.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    530,
    '26392',
    '2013-02-07',
    'Poner Trafo de Separación Galvánica, dentro caja Himel.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    531,
    '26392',
    '2013-03-27',
    'Sustitución F.A. y desconectar Tierra de la misma'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    532,
    '26392',
    '2014-09-30',
    'Fallos de Comunicación, durante varios días seguidos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    533,
    '26392',
    '2014-10-10',
    'Cambiar Motorola GP340.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    534,
    '26392',
    '2014-11-20',
    'Quitar F.A. averiada y poner Victron provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    535,
    '26392',
    '2015-02-04',
    'Reponer F.A. reparada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    536,
    '26392',
    '2015-09-04',
    'Modificación según Resolución.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    537,
    '26392',
    '2016-05-26',
    'Modificación de la acometida eléctrica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    538,
    '26392',
    '2016-12-02',
    'Se pinta con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (539, '26450', '2009-02-17', 'Sustitución baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (540, '26450', '2014-01-27', 'Pintura Nueva.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    541,
    '26450',
    '2015-09-16',
    'Puesto PFV Mesemar de 95 W.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (542, '26450', '2017-09-18', 'Sustituir LDR nº 1');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (543, '26504', '2015-04-20', 'Reformada y pintada. ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    544,
    '26504',
    '2015-06-09',
    'Se ajusta el ritmo de destellos (estaba desconfigurado).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (545, '26508', '2015-04-20', 'Reformada y pintada. ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (546, '26510', '2015-04-20', 'Reformada y pintada. ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    547,
    '26512',
    '2020-04-20',
    '5 Reformada y pintada. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (549, '26058.2', '2011-11-11', 'adgsh');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (550, '26058.2', '2011-11-11', 'adgsh');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (551, '26058.2', '2011-11-11', 'adgsh');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: observaciones
# ------------------------------------------------------------

INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (1, '25545', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (2, '25545', 'Dos LDR para Baliza y para Litepipe');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (3, '25545', 'Retirar cuadro de telefonica');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (4, '25552', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (5, '25552', 'Dos LDR');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    6,
    '25554',
    'Pendiente de sacar con Wartsila, para revisar'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (7, '25560', 'Tiene cuatro coronas');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (8, '25563', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (9, '25564', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (10, '25565', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (11, '25565', 'Limar Marco');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    12,
    '25565',
    'Tiene 4 coronas LEDs. Añadir coronas.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    13,
    '25570',
    'Fijar STECA con tornilla rosca chapa'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (14, '25570', 'Necesita ser repitanda');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (15, '25570', 'Tiene 3 coronas + 1 sin óptica');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (16, '25720', 'sincronizada con 25721');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (17, '25721', 'Sincronizada con 25720');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    18,
    '25740',
    'la boya sustituta de la roja de bocana 25740 ya está preparada con su fondeo nuevo + linterna MCL200 en campa Sur auxiliar.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (19, '25761', 'Sincronizada con 25765');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (20, '25765', 'Sincronizada con 25761');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (21, '25776', 'Sincronizada con 25777');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (22, '25777', 'Sincronizada con 25776');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (23, '25820', 'sincronizada con 25820.1');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (24, '25820.1', 'sincronizada con la baliza 25820');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (25, '25830', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (26, '25831', '30/10/2014 Entra en servicio ');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    27,
    '25831',
    'Sincronizada con la nº 20 -  Nif 25830'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (28, '26045', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (29, '26046', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (30, '26047', 'Entra en servicio el 26/06/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (31, '26047.1', 'Apagada definitivamente');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    32,
    '26047.1',
    'Dispone de un sector de oscuridad 205º-295º (90º)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (33, '26047.1', 'Entra en servicio el 31/05/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    34,
    '26047.2',
    'Dispone de un sector de oscuridad de 115º - 295º (180º)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (35, '26047.2', 'Entra en servicio el 29/05/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (36, '26048', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (37, '26048', 'Entra en servicio el 26/06/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (38, '26048.1', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (39, '26048.1', 'Entra en servicio el 06/06/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    40,
    '26048.2',
    'Entra en servicio el jueves 30/05/2013'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (41, '26048.2', 'Sincronizada con 26048.3');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (42, '26048.3', 'Entra en sevicio el 31/05/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (43, '26048.3', 'Sincronizada con  26048.2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (44, '26049', 'sincronizada con 26050');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (45, '26050', 'sincronizada con 26049');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (46, '26052.5', 'Baliza el limite del talud.');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (47, '26052.7', 'Baliza el limite del talud.');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    48,
    '26058.15',
    'El 102 Local hace referencia a 26058.15A y 26058.15B a Estribor entrando '
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    49,
    '26058.15',
    'Se da de alta la señal el 05/04/2016'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    50,
    '26058.15',
    'Todos los semáforos del puente están sincronizados.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    51,
    '26058.16',
    'El 103 Local hace referencia a 26058.16A y 26058.16B a Babor entrando '
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    52,
    '26058.16',
    'Se da de alta la señal el 19/04/2016'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    53,
    '26058.16',
    'Todos los semáforos del puente están sincronizados.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    54,
    '26058.17',
    'El 104 Local hace referencia a 26058.17A - 26058.17B - 26058.17C - 26058.17D'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    55,
    '26058.17',
    'Se da de alta la señal el 19/04/2016'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    56,
    '26058.17',
    'sobre el tablero en la parte central '
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    57,
    '26058.17',
    'Todos los semáforos del puente están sincronizados.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    58,
    '26190',
    'No tiene reflector de radar pasivo porque la estructura es métalica y 6,3 millas de distancia de reconocimiento en radar.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (59, '26202', 'Sector Obscuridad 30º-170º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (60, '26205', 'Sector Oscuridad 215º - 305º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (61, '26285', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (62, '26285', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (63, '26290', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (64, '26311', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (65, '26311', 'LDRs a 180º.');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (66, '26312', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (67, '26313', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (68, '26314', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    69,
    '26320',
    'Habría que cambiar su denominación en el SCADA'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (70, '26320', 'LDRS a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    71,
    '26320',
    'Se ve con la camara &quot;Regasificadora 5&quot;'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (72, '26325', 'LDRs a 0º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (73, '26326', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (74, '26326', '26/07/13: Entra en servicio.');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (75, '26326', 'LDRs a 0º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (76, '26360', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    77,
    '26360',
    'Trabajando con el telecontrol desconectado, sin problemas.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (78, '26380', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (79, '26390', 'LDRs a 0º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (80, '26392', 'LDRs a 0º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (81, '26450', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    82,
    '26470',
    'Suprimida temporalmente. Agosto 2018'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    83,
    '26471',
    'Suprimida temporalmente. Agosto 2018'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    84,
    '26472',
    'Suprimida temporalmente. Agosto 2018'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    85,
    '26473',
    'Suprimida temporalmente. Agosto 2018'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (86, '26508', 'Sector Obscuridad 180º-360º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (91, '26285', 'jnlk');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (94, '25530', 'lkçl´çll');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (95, '25530', 'hjlkhljhl');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (96, '26058.2', 'prueba');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (97, '25470', 'KLÑÑL');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    '11KR_FNc6ETeGPctXvtxPGykJWgOdumF',
    1660733139,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"warning\":[\"Sucedió algun error!\",\"Sucedió algun error!\",\"Sucedió algun error!\",\"Sucedió algun error!\",\"Sucedió algun error!\",\"Sucedió algun error!\"]},\"passport\":{\"user\":1}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'CXBzE0pKILjOsddewwLPczq-PZ2nh8Q3',
    1660738006,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'EO2uNJ1LYKOVdUZbRi2z1TSE2FzgtXG_',
    1660766689,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'GKlfGic_oKXTcr6Ts2dz-b9bG9sjaryl',
    1660738006,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'GNQvIAmXUS5GREkLp5ZBSePHyWVzhcNs',
    1660755668,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'Me3BQ6jaBBLgkZxci_EuRTSQ0uZZlKiK',
    1660738003,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'VhcyvYF2AO8PftYt3JczEq4_D8hD66XW',
    1660758368,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'WBqYilij9itkAasC09XTQV0fQbu13AFL',
    1660775400,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'b1q4ztxdB7xCe5jpVLU94fCywHvLjZ4G',
    1660755668,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'g9ZE7nMhcQin4azNcWj36ytaUMBXnxl5',
    1660808300,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":1}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'kqtdQbsYBcIft9K_u3GJBxbmH81Yt1Uv',
    1660783621,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'mQLV1Q592lUVN5-lbhaKNOYHhpngj-Zp',
    1660740079,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":1}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'qUb28SJGJiJa142kd1SOGZvy_qGbefaQ',
    1660742347,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: usuarios
# ------------------------------------------------------------

INSERT INTO
  `usuarios` (
    `id`,
    `usuario`,
    `contrasena`,
    `email`,
    `full_name`,
    `privilegio`,
    `pictureURL`
  )
VALUES
  (
    1,
    'user1',
    '$2a$10$FEnVNECHkhfiJYhsgRCdh.dAsJE4tp3NmQzqEJmNpzEgnlcN5h8km',
    'user1@user1.com',
    'user1 completo',
    'admin',
    '1659038902441.jpg'
  );
INSERT INTO
  `usuarios` (
    `id`,
    `usuario`,
    `contrasena`,
    `email`,
    `full_name`,
    `privilegio`,
    `pictureURL`
  )
VALUES
  (
    6,
    'prueba1',
    '$2y$10$c2MZdl5emtueOz86sMOrPeUfGVf5WI9PeoWUyc8K8WJ.HWBhM6qnG',
    'prueba@prueba.es',
    NULL,
    'san',
    NULL
  );
INSERT INTO
  `usuarios` (
    `id`,
    `usuario`,
    `contrasena`,
    `email`,
    `full_name`,
    `privilegio`,
    `pictureURL`
  )
VALUES
  (
    7,
    '',
    '$2y$10$NtNqXn06Q93Hmq.ymCBM7ufN5jdvaKj6YKL0ja0r5oO5KpMxWDkVm',
    '',
    NULL,
    'san',
    NULL
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
