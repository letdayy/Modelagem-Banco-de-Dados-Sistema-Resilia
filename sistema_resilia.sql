-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Jan-2023 às 21:41
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_resilia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `alunoId` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(100) DEFAULT NULL,
  `dataDeNascimento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `fk_cursoId` int(11) DEFAULT NULL,
  `fk_enderecoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `cursoId` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `modulos` int(11) DEFAULT NULL,
  `fk_turmaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `enderecoId` int(11) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `professorId` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `formacao` varchar(100) DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `turmaId` int(11) NOT NULL,
  `numeracao` varchar(100) DEFAULT NULL,
  `entrada` time DEFAULT NULL,
  `saida` time DEFAULT NULL,
  `fk_professorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`alunoId`),
  ADD KEY `fk_cursoId` (`fk_cursoId`),
  ADD KEY `fk_enderecoId` (`fk_enderecoId`);

--
-- Índices para tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cursoId`),
  ADD KEY `fk_turmaId` (`fk_turmaId`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`enderecoId`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`professorId`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`turmaId`),
  ADD KEY `fk_professorId` (`fk_professorId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `alunoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `cursoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `enderecoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `professorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `turmaId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`fk_cursoId`) REFERENCES `curso` (`cursoId`),
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`fk_enderecoId`) REFERENCES `endereco` (`enderecoId`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`fk_turmaId`) REFERENCES `turma` (`turmaId`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`fk_professorId`) REFERENCES `professor` (`professorId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
